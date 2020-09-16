////
////  NIM.swift
////  ActionCell
////
////  Created by Đặng Duy Cường on 10/25/19.
////  Copyright © 2019 Ngô Bảo Châu. All rights reserved.
////
//
//import Foundation
////
////  TraCuuTTThienTaiRouter.swift
////  VSmart
////
////  Created by MacOne on 8/23/19.
////  Copyright © 2019 ITSOL. All rights reserved.
////
//
//import Alamofire
//import SwiftyJSON
//
//enum NIMEndpoint {
//    case getDataDashboard(startDate: String, endDate: String)
//    case searchCR(params : Dictionary<String, Any>)
//    case updateCR(params : Dictionary<String, Any>, updateType: UpdateActionType)
//    case insertWorkLog(params : Dictionary<String, Any>)
//    case getCRDetails(crId: String)
//    case getListCrApprovalDepartmentDTOs(crId: String, userId: String, startRow: Int, maxRow: Int)
//    case getCrAttachedFiles(crId: String, startRow: Int, maxRow: Int)
//    case getListCrHistories(crId: String, userId: String, startRow: Int, maxRow: Int)
//    case getListCrImpactNetworkNodes(crId: String)
//    case getListCrAffectNetworkNodes(crId: String)
//    case getListCrWorkLogs(crId: String)
//    case getListCrWorkOrders(crId: String)
//    case getListDependedCR(crId: String)
//    case getCrImportFiles(crId: String)
//    case getListCrModules(crId: String)
//    case getListCrVendors(crId: String)
//    case getListCrAlarms(crId: String)
//    case getCrImpactCables(crId: String)
//    case getCrImpactLines(crId: String)
//    case getLinkInCables(crId: String)
//    case getCountries(crId: String)
//    case getListImpactSegmentCBB(crId: String)
//    case getListSubcategoryCBB(crId: String)
//    case getListScopeOfUserForAllRole
//    case getListReason(actionCode: Int)
//    case getListUser(unitId: String)
//    case getUserInfor
//    case getListUserCab
//    case getFileByPath(filePath: String, crId: String)
//    //cuongdd-nhom hanh dong
//    case getListUserGroupBySystem(objectType: String)
//    //cuongdd-kieu workLog
//    case getListWorkLogCategoryDTO(groupActionId: String, rowStart: String, maxRow: String, sortType: String, sortFieldList: String)
//}
//class NIMRouter: BaseRouter {
//    
//    var endpoint: NIMEndpoint
//    
//    init(endpoint: NIMEndpoint) {
//        self.endpoint = endpoint
//    }
//    
//    override var path: String {
//        switch endpoint {
//        case .getDataDashboard(_,_):
//            return "rest/crController/actionGetMonitoringParamFix"
//        case .searchCR(_):
//            return "rest/crController/getListCRByMobileFix"
//        case .updateCR(_, let updateType):
//            
//            switch updateType {
//            case .actionApproveCR:
//                return "rest/crController/actionApproveCR"
//            case .actionVerify:
//                return "rest/crController/actionVerify"
//            case .actionAssignCab:
//                return "rest/crController/actionAssignCab"
//            case .actionCab:
//                return "rest/crController/actionCab"
//            case .actionScheduleCr:
//                return "rest/crController/actionScheduleCr"
//            case .actionCloseCr:
//                return "rest/crController/actionCloseCr"
//            }
//            
//        case .insertWorkLog(_):
//            return "rest/crController/insertWorkLog"
//        case .getCRDetails(_):
//            return "rest/crController/findCrById"
//        case .getListCrApprovalDepartmentDTOs(_,_,_,_):
//            return "rest/crController/getListCrApprovalDepartmentDTO"
//        case .getCrAttachedFiles(_,_,_):
//            return "rest/crController/getListCrFilesAttachDTO"
//        case .getListCrHistories(_,_,_,_):
//            return "rest/crController/getListCrHisDTO"
//        case .getListCrImpactNetworkNodes(_):
//            return "rest/crController/getLisNodeOfCR"
//        case .getListCrAffectNetworkNodes(_):
//            return "rest/crController/getListCrImpactedNodesDTO"
//        case .getListCrWorkLogs(_):
//            return "rest/crController/getListWorklogSearch"
//        case .getListCrWorkOrders(_):
//            return "rest/crController/getListCrWorkOrders"
//        case .getListDependedCR(_):
//            return "rest/crController/getListSecondaryCr"
//        case .getCrImportFiles(_):
//            return "rest/crController/getListFileImportByProcess"
//        case .getListCrModules(_):
//            return "rest/crController/getListModuleByCr"
//        case .getListCrVendors(_):
//            return "rest/crController/getListVendorByCr"
//        case .getListCrAlarms(_):
//            return "rest/crController/getListAlarmByCr"
//        case .getCrImpactCables(_):
//            return "rest/crController/getListCrCableDTO"
//        case .getCrImpactLines(_):
//            return "rest/crController/getListCrCableDTO"
//        case .getLinkInCables(_):
//            return "rest/crController/getLinkInCables"
//        case .getCountries(_):
//            return "rest/crController/getListLocationByLevelCBB"
//        case .getListImpactSegmentCBB(_):
//            return "rest/crController/getListImpactSegmentCBB"
//        case .getListSubcategoryCBB(_):
//            return "rest/crController/getListSubcategoryCBB"
//        case .getListScopeOfUserForAllRole:
//            return "rest/crController/getListScopeOfUserForAllRole"
//        case .getListReason(_):
//            return "rest/crController/getListReturnCodeByActionCode"
//        case .getListUser(_):
//            return "rest/crController/actionGetListUser"
//        case .getUserInfor:
//            return "rest/crController/getUserInfor"
//        case .getListUserCab:
//            return "rest/crController/getListUserCab"
//        case .getFileByPath(_,_):
//            return "rest/crController/getFileByPath"
//        //cuongdd-(lay nhom hanh dong)
//        case .getListUserGroupBySystem(_):
//            return "rest/crController/getListUserGroupBySystem"
//        //cuongdd-lay kieu workLog
//        case .getListWorkLogCategoryDTO(_, _, _, _, _):
//            return "rest/crController/getListWorkLogCategoryDTO"
//        }
//    }
//    
//    override var method: HTTPMethod {
//        return .post
//    }
//    
//    override var parameters: [String: Any]? {
//        var params = [String: Any]()
//        //let token = LocalUser.shared.currentUser?.token ?? "token"
//        let userId = LocalUser.shared.currentUser?.userId ?? "userId"
//        let userName = LocalUser.shared.currentUser?.username ?? "userName"
//        
//        switch endpoint {
//            
//        case .getDataDashboard(let startDate, let endDate):
//            params["startDate"] = startDate
//            params["endDate"] = endDate
//            params["userAssignId"] = userId
//            params["userName"] = userName
//            
//        case .searchCR(let searchParams):
//            params = searchParams as [String : Any]
//            params["userAssignId"] = userId
//            params["userName"] = userName
//            
//        case .updateCR(let updateParams,_):
//            let jsonParams = updateParams.toString()
//            params["crDTO"] = jsonParams
//            
//        case .insertWorkLog(let addParams):
//            params = addParams
//            
//        case .getCRDetails(let crId):
//            params["crDTOId"] = crId
//            params["userAssignId"] = userId
//            params["userName"] = userName
//            
//        case .getListCrApprovalDepartmentDTOs(let crId,let userID, let startRow, let maxRow):
//            params["crId"] = crId
//            params["userAssignId"] = userId
//            params["userId"] = userID
//            params["rowStart"] = startRow
//            params["maxRow"] = maxRow
//            
//        case .getCrAttachedFiles(let crId, let startRow, let maxRow):
//            params["crId"] = crId
//            //params["userAssignId"] = userId
//            params["rowStart"] = startRow
//            params["maxRow"] = maxRow
//            params["sortType"] = ""
//            params["sortFieldList"] = ""
//            
//        case .getListCrHistories(let crId,let userID, let startRow, let maxRow):
//            params["crId"] = crId
//            params["userAssignId"] = userId
//            params["userId"] = userID
//            params["rowStart"] = startRow
//            params["maxRow"] = maxRow
//            
//        case .getListCrImpactNetworkNodes(let crId):
//            params["crId"] = crId
//            //params["userAssignId"] = userId
//            params["crCreatedDate"] = ""
//            params["earlierStartTime"] = ""
//            params["nodeType"] = ""
//            params["saveType"] = ""
//            
//        case .getListCrAffectNetworkNodes(let crId):
//            params["crId"] = crId
//            //params["userAssignId"] = userId
//            params["rowStart"] = self.skip
//            params["maxRow"] = self.limit
//            params["sortType"] = ""
//            params["sortFieldList"] = ""
//            
//        case .getListCrWorkLogs(let crId):
//            params["objectId"] = crId
//            params["objectType"] = 2
//            
//        case .getListCrWorkOrders(let crId):
//            params["crId"] = crId
//            params["userAssignId"] = userId
//            
//        case .getListDependedCR(let crId):
//            params["crId"] = crId
//            //params["userAssignId"] = userId
//            
//        case .getCrImportFiles(let crId):
//            params["crId"] = crId
//            params["userAssignId"] = userId
//            
//        case .getListCrModules(let crId):
//            params["crId"] = crId
//            params["userAssignId"] = userId
//            
//        case .getListCrVendors(let crId):
//            params["crId"] = crId
//            params["userAssignId"] = userId
//            
//        case .getListCrAlarms(let crId):
//            params["crId"] = crId
//            params["userAssignId"] = userId
//            
//        case .getCrImpactCables(let crId):
//            params["crId"] = crId
//            params["rowStart"] = 1
//            params["maxRow"] = 100
//            params["sortType"] = ""
//            params["sortFieldList"] = ""
//            
//        case .getCrImpactLines(let crId):
//            params["crId"] = crId
//            params["rowStart"] = 1
//            params["maxRow"] = 100
//            params["sortType"] = ""
//            params["sortFieldList"] = ""
//            
//        case .getLinkInCables(let crId):
//            params["crId"] = crId
//            
//        case .getCountries(_):
//            break
//        case .getListImpactSegmentCBB(_):
//            break
//        case .getListSubcategoryCBB(_):
//            break
//            
//        case .getListScopeOfUserForAllRole:
//            params["userLogin"] = userName
//            
//        case .getListReason(let actionCode):
//            params["actionCode"] = actionCode
//            break
//            
//        case .getListUser(let unitId):
//            params["unitId"] = unitId
//            break
//        case .getUserInfor:
//            params["userName"] = userName
//            
//        case .getListUserCab:
//            break
//            
//        case .getFileByPath(let filePath, let crId):
//            params["filePath"] = filePath
//            params["crId"] = crId
//        //cuongdd-nhom hanh dong
//        case .getListUserGroupBySystem(let objectType):
//            params["objectType"] = objectType
//        //cuongdd-kieu workLog
//        case .getListWorkLogCategoryDTO(let groupActionId, let rowStart, let maxRow, let sortType, let sortFieldList):
//            params["groupActionId"] = groupActionId
//            params["rowStart"] = rowStart
//            params["maxRow"] = maxRow
//            params["sortType"] = sortType
//            
//            params["sortFieldList"] = sortFieldList
//        }
//        
//        
//        return params
//    }
//    
//    override var multipartBody: [MultipartFormData]? {
//        let form = MultipartFormData()
//        switch endpoint {
//        default:
//            return nil
//        }
//    }
//    
//    override var parameterEncoding: ParameterEncoding {
//        switch endpoint {
//            //        case .getStationByUserNameAndStationCode(_,_,_):
//        //            return JSONEncoding.default
//        default:
//            return URLEncoding.default
//        }
//        //return URLEncoding.default
//    }
//    
//    
//    override var uploadFiles : [UploadFile]? {
//        var files = [UploadFile]()
//        switch endpoint {
//            
//        default:
//            return nil
//        }
//    }
//    
//    override var headerFields: [String: String]? {
//        return self.defaultHeader()
//    }
//    
//    override func response(json: JSON) -> Any? {
//        switch endpoint {
//            
//        case .getDataDashboard(_,_):
//            return NIMDashboard(byJSON: json)
//            
//        case .searchCR(_):
//            return [CRSearchResultModel](byJSON: json["result"]["lstCrDTO"])
//            
//        case .updateCR(_):
//            return json
//            
//        case .insertWorkLog(_):
//            return json
//            
//        case .getCRDetails(_):
//            return json
//            
//        case .getListCrApprovalDepartmentDTOs(_,_,_,_):
//            return [CrApprovalDepartmentDTO](byJSON: json["result"])
//            
//        case .getCrAttachedFiles(_,_,_):
//            return [CrAttachedFile](byJSON: json["result"])
//            
//        case .getListCrHistories(_):
//            return [CrHisDTO](byJSON: json["result"])
//            
//        case .getListCrImpactNetworkNodes(_):
//            return [CrNetworkNode](byJSON: json["result"])
//            
//        case .getListCrAffectNetworkNodes(_):
//            return [CrNetworkNode](byJSON: json["result"])
//            
//        case .getListCrWorkLogs(_):
//            return [CrWorkLog](byJSON: json["result"])
//            
//        case .getListCrWorkOrders(_):
//            return [CrWorkOrder](byJSON: json["result"])
//            
//        case .getListDependedCR(_):
//            return [CRSearchResultModel](byJSON: json["result"])
//            
//        case .getCrImportFiles(_):
//            return [CrAttachedFile](byJSON: json["result"])
//            
//        case .getListCrModules(_):
//            return [CrModule](byJSON: json["result"])
//            
//        case .getListCrVendors(_):
//            return [CrVendor](byJSON: json["result"])
//            
//        case .getListCrAlarms(_):
//            return [CrAlarm](byJSON: json["result"])
//            
//        case .getCrImpactCables(_):
//            return [CrImpactCableLane](byJSON: json["result"])
//            
//        case .getCrImpactLines(_):
//            return [CrImpactCableLine](byJSON: json["result"])
//            
//        case .getLinkInCables(_):
//            return [CrCableLinkInfo](byJSON: json["result"])
//            
//        case .getCountries(_):
//            return [NationalModel](byJSON: json["result"])
//            
//        case .getListImpactSegmentCBB(_):
//            return [ImpactListModel](byJSON: json["result"])
//            
//        case .getListSubcategoryCBB(_):
//            return [CRSubCategoryCBB](byJSON: json["result"])
//            
//        case .getListScopeOfUserForAllRole:
//            return [AreaModel](byJSON: json["result"])
//            
//        case .getListReason(_):
//            return [NIMReasonTypeModel](byJSON: json["result"])
//            
//        case .getListUser(_):
//            return [FTUser](byJSON: json["result"])
//            
//        case .getUserInfor:
//            return json
//            
//        case .getListUserCab:
//            return [FTUser](byJSON: json["result"])
//            
//        case .getFileByPath(_,_):
//            return json
//        //cuongdd-nhom hanh dong
//        case .getListUserGroupBySystem:
//            var listReturn: [UserGroupBySystem] = []
//            if json["result"].array != nil {
//                for value in json["result"].array! {
//                    let oneData = UserGroupBySystem()
//                    oneData.mapping(json: value)
//                    listReturn.append(oneData)
//                }
//            }
//            return listReturn
//        case .getListWorkLogCategoryDTO:
//            var listReturn: [WorkLogCategoryDTO] = []
//            if json["result"].array != nil {
//                for value in json["result"].array! {
//                    let oneData = WorkLogCategoryDTO()
//                    oneData.mapping(json: value)
//                    listReturn.append(oneData)
//                }
//            }
//            return listReturn
//        }
//    }
//    
//    override func otherResponse(json: JSON) -> Any? {
//        
//        switch endpoint {
//        case .searchCR(_):
//            return json["result"]["totalRow"].intValue
//        default:
//            return nil
//        }
//    }
//    
//    override func errorResponse(json: JSON) -> Any? {
//        return BaseDataModel(byJSON: json)
//    }
//}
