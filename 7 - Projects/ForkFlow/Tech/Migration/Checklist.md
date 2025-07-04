Here is a **full checklist** of all files still importing from `@mui/material` or `@mui/icons-material`, including the specific lines where the imports occur. You can use this as a migration tracker:

---

### 📝 Migration Checklist: Remove MUI Imports
**Instructions:**  
- Check off each file as you migrate it away from MUI.
- For each line, replace the MUI import with the appropriate UI kit or icon library import, and refactor usage as needed.
- For each target file, replace MUI components with UI kit equivalents.
- Refactor props and styles to match the new system.
- Remove MUI-specific props (e.g., `variant`, `gutterBottom`).
- After all files are migrated, delete all `@mui/material` and `@mui/icons-material` imports.
 
- [x] **src/visits/VisitShow.tsx**
  - Line 20: `import { Divider } from '@mui/material';`
  - Line 26: `} from '@mui/icons-material';`
- [x] **src/visits/VisitList.tsx**
  - Line 25: `} from '@mui/icons-material';`
- [x] **src/visits/VisitCreate.tsx**
  - Line 24: `} from '@mui/material';`
  - Line 29: `} from '@mui/icons-material';`
- [x] **src/users/UserProfileDashboard.tsx**
  - Line 39: `} from '@mui/icons-material';`
- [x] **src/users/UserListFilter.tsx**
  - Line 24: `} from '@mui/icons-material';`
- [x] **src/users/UserList.tsx**
  - Line 54: `} from '@mui/icons-material';`
- [x] **src/users/UserEmpty.tsx**
  - Line 3: `import { People as PeopleIcon } from '@mui/icons-material';`
- [x] **src/users/UserEdit.tsx**
  - Line 41: `} from '@mui/icons-material';`
- [x] **src/users/UserCreate.tsx**
  - Line 35: `} from '@mui/icons-material';`
- [x] **src/users/UserActivityTracker.tsx**
  - Line 15: `} from '@mui/icons-material';`
- [ ] **src/tasks/AddTask.tsx**
  - Line 0: `import ControlPointIcon from '@mui/icons-material/ControlPoint';`
  - Line 11: `} from '@mui/material';`
- [ ] **src/tags/TagDialog.tsx**
  - Line 0: `import ContentSave from '@mui/icons-material/Save';`
- [ ] **src/settings/SettingsEdit.tsx**
  - Line 12: `import { CardContent, Grid } from '@mui/material';`
- [ ] **src/settings/SettingsCreate.tsx**
  - Line 15: `import { CardContent, Grid, Box, Typography, Alert } from '@mui/material';`
- [ ] **src/settings/SettingsBulkOperations.tsx**
  - Line 16: `} from '@mui/material';`
  - Line 24: `} from '@mui/icons-material';`
- [ ] **src/settings/SettingsAdminDashboard.tsx**
  - Line 13: `} from '@mui/material';`
  - Line 28: `} from '@mui/icons-material';`
- [ ] **src/settings/PrincipalManager.tsx**
  - Line 26: `} from '@mui/material';`
  - Line 27: `import { DragIndicator, Visibility, VisibilityOff } from '@mui/icons-material';`
- [ ] **src/security/SessionManager.tsx**
  - Line 29: `} from '@mui/material';`
  - Line 43: `} from '@mui/icons-material';`
- [ ] **src/security/SecurityTestSuite.tsx**
  - Line 22: `} from '@mui/material';`
  - Line 38: `} from '@mui/icons-material';`
- [ ] **src/security/SecurityPolicyManager.tsx**
  - Line 27: `} from '@mui/material';`
  - Line 40: `} from '@mui/icons-material';`
- [ ] **src/security/SecurityDashboard.tsx**
  - Line 15: `} from '@mui/material';`
  - Line 41: `} from '@mui/icons-material';`
- [ ] **src/security/SecurityAuditLog.tsx**
  - Line 56: `} from '@mui/icons-material';`
- [ ] **src/security/MFASetup.tsx**
  - Line 42: `} from '@mui/icons-material';`
- [ ] **src/security/ComplianceDocumentation.tsx**
  - Line 33: `} from '@mui/material';`
  - Line 52: `} from '@mui/icons-material';`
- [x] **src/reminders/ReminderShow.tsx**
  - Line 8: `} from '@mui/icons-material';`
  - Line 17: `} from '@mui/material';`
- [x] **src/reminders/ReminderList.tsx**
  - Line 24: `} from '@mui/material';`
  - Line 32: `} from '@mui/icons-material';`
- [x] **src/reminders/ReminderDashboard.tsx**
  - Line 11: `} from '@mui/material';`
  - Line 18: `} from '@mui/icons-material';`
- [x] **src/reminders/ReminderCreate.tsx**  X
  - Line 11: `import { Card, CardContent, Typography, Box, Chip, Alert } from '@mui/material';`
  - Line 16: `} from '@mui/icons-material';`
- [x] **src/products/ProductComparison.tsx**
  - Line 12: `} from '@mui/material';`
  - Line 26: `} from '@mui/icons-material';`
- [x] **src/products/ProductShow.tsx**
  - Line 16: `import { Grid, Divider } from '@mui/material';`
  - Line 27: `} from '@mui/icons-material';`
- [x] **src/products/ProductList.tsx**
  - Line 29: `import { Grid } from '@mui/material';`
  - Line 30: `import { Edit as EditIcon, Visibility as ViewIcon } from '@mui/icons-material';`
- [x] **src/products/ProductEdit.tsx**
  - Line 24: `} from '@mui/icons-material';`
- [x] **src/products/ProductCreate.tsx**
  - Line 22: `} from '@mui/icons-material';`
- [x] **src/products/ProductBulkActions.tsx**
  - Line 12: `} from '@mui/icons-material';`
- [x] **src/opportunities/OpportunityCreate.tsx**
  - Line 21: `} from '@mui/material';`
- [x] **src/opportunities/OpportunityListFilter.tsx**
  - Line 9: `import BusinessIcon from '@mui/icons-material/Business';`
  - Line 10: `import PersonIcon from '@mui/icons-material/Person';`
  - Line 11: `import TrendingUpIcon from '@mui/icons-material/TrendingUp';`
  - Line 12: `import FlagIcon from '@mui/icons-material/Flag';`
  - Line 13: `import AccountCircleIcon from '@mui/icons-material/AccountCircle';`
  - Line 14: `import PercentIcon from '@mui/icons-material/Percent';`
  - Line 15: `import DateRangeIcon from '@mui/icons-material/DateRange';`
- [x] **src/opportunities/OpportunityListContent.tsx**
  - Line 1: `import { Box } from '@mui/material';`
- [x] **src/opportunities/OpportunityList.tsx**
  - Line 12: `import { Card, Stack } from '@mui/material';`
- [x] **src/opportunities/OpportunityEmpty.tsx**
  - Line 1: `import TrendingUpIcon from '@mui/icons-material/TrendingUp';`
- [x] **src/opportunities/OpportunityEdit.tsx**
  - Line 24: `} from '@mui/material';`
- [x] **src/opportunities/OpportunityColumn.tsx**
  - Line 1: `import { Box, Chip, Paper, Typography } from '@mui/material';`
- [x] **src/opportunities/OpportunityCard.tsx**
  - Line 10: `} from '@mui/material';`
  - Line 17: `} from '@mui/icons-material';`
- [x] **src/opportunities/OpportunityShow.tsx**
  - Line 25: `} from '@mui/material';`
  - Line 36: `} from '@mui/icons-material';`
- [x] **src/organizations/show/OrganizationShow.tsx**
  - Line 15: `import { Button as MuiButton, Dialog, DialogContent } from '@mui/material';`
  - Line 30: `} from '@mui/icons-material';`
- [x] **src/organizations/list/AdvancedOrganizationFilter.tsx**
  - Line 19: `} from '@mui/material';`
  - Line 26: `} from '@mui/icons-material';`
- [x] **src/organizations/list/EnhancedOrganizationList.tsx**
  - Line 15: `import { Stack, Button, Dialog, DialogContent, Box, Chip } from '@mui/material';`
  - Line 20: `} from '@mui/icons-material';`
- [x] **src/organizations/list/OrganizationCards.tsx**
  - Line 22: `} from '@mui/icons-material';`
- [x] **src/organizations/list/OrganizationEmpty.tsx**
  - Line 1: `import BusinessIcon from '@mui/icons-material/Business';`
- [x] **src/organizations/list/OrganizationKanban.tsx**
  - Line 14: `} from '@mui/material';`
  - Line 22: `} from '@mui/icons-material';`
- [x] **src/organizations/list/OrganizationList.tsx**
  - Line 19: `import { Dialog, DialogContent, useMediaQuery, useTheme } from '@mui/material';`
  - Line 23: `} from '@mui/icons-material';`
- [x] **src/organizations/list/OrganizationMapView.tsx**
  - Line 26: `} from '@mui/material';`
  - Line 44: `} from '@mui/icons-material';`
- [x] **src/organizations/list/OrganizationTable.tsx**
  - Line 15: `} from '@mui/material';`
  - Line 20: `} from '@mui/icons-material';`
- [x] **src/organizations/list/VirtualizedOrganizationTable.tsx**
  - Line 17: `} from '@mui/material';`
  - Line 22: `} from '@mui/icons-material';`
- [x] **src/organizations/form/OrganizationInputs.tsx**
  - Line 1: `import { Divider, useMediaQuery, useTheme } from '@mui/material';`
  - Line 2: `import { LocationOn as LocationIcon } from '@mui/icons-material';`
- [x] **src/organizations/common/VoiceInput.tsx**
  - Line 16: `} from '@mui/material';`
  - Line 25: `} from '@mui/icons-material';`
- [x] **src/organizations/common/ViewModeRenderer.tsx**
  - Line 1: `import { Box, CircularProgress, Fade } from '@mui/material';`
- [x] **src/organizations/form/steps/BasicInfoStep.tsx**
  - Line 8: `} from '@mui/material';`
  - Line 28: `} from '@mui/icons-material';`
- [x] **src/organizations/form/steps/BusinessDetailsStep.tsx**
  - Line 9: `} from '@mui/material';`
  - Line 28: `} from '@mui/icons-material';`
- [x] **src/organizations/form/steps/ValidationProvider.tsx**
  - Line 10: `} from '@mui/material';`
  - Line 15: `} from '@mui/icons-material';`
- [x] **src/organizations/form/steps/ContactDetailsStep.tsx**
  - Line 22: `} from '@mui/icons-material';`
- [x] **src/organizations/common/SmartKeyboard.tsx**
  - Line 15: `} from '@mui/material';`

---
Here’s a **prioritized, grouped checklist** for your remaining MUI-to-UI-kit/Heroicons migration.  
This order is designed to minimize breakage and maximize efficiency, starting with the most foundational/shared components and high-traffic features.

---

## 🟢 **Highest Priority (Core/Shared & High-Usage Features)**

- [ ] **Shared Components & Utilities**
  - [ ] `src/components/Typography/Typography.tsx`
  - [ ] `src/common/LazyLoadingUtils.tsx`
  - [ ] `src/misc/DialogCloseButton.tsx`
  - [ ] `src/misc/Status.tsx`
  - [ ] `src/misc/ContactOption.tsx`
  - [ ] `src/misc/ImageEditorField.tsx`

- [ ] **Authentication & Login**
  - [ ] `src/login/UserProfilePage.tsx`
  - [ ] `src/login/SetNewPasswordPage.tsx`
  - [ ] `src/login/PasswordResetPage.tsx`
  - [ ] `src/login/components/ProfileForm.tsx`
  - [ ] `src/login/components/PasswordChangeForm.tsx`
  - [ ] `src/login/components/SecuritySettings.tsx`

---

## 🟡 **High Priority (Organizations, Notes, Interactions)**

- [ ] **Organizations**
  - [ ] `src/organizations/list/OrganizationMapView.tsx`
  - [ ] `src/organizations/form/steps/ValidationProvider.tsx`
  - [ ] `src/organizations/form/steps/BusinessDetailsStep.tsx`
  - [ ] `src/organizations/form/steps/BasicInfoStep.tsx`
  - [ ] `src/organizations/form/MultiStepOrganizationEdit.tsx`
  - [ ] `src/organizations/form/MultiStepOrganizationCreate.tsx`
  - [ ] `src/organizations/form/MobileOrganizationCreate.tsx`
  - [ ] `src/organizations/common/VoiceInput.tsx`
  - [ ] `src/organizations/common/SmartKeyboard.tsx`
  - [ ] `src/organizations/common/MobileFAB.tsx`
  - [ ] `src/organizations/common/OrganizationCard.tsx`
  - [ ] `src/organizations/common/LayoutSelector.tsx`

- [ ] **Notes**
  - [ ] `src/notes/StatusSelector.tsx`
  - [ ] `src/notes/NotesIterator.tsx`
  - [ ] `src/notes/NoteInputs.tsx`
  - [ ] `src/notes/NoteAttachments.tsx`
  - [ ] `src/notes/Note.tsx`

- [ ] **Interactions**
  - [ ] `src/interactions/InteractionInputs.tsx`
  - [ ] `src/interactions/InteractionShow.tsx`
  - [ ] `src/interactions/InteractionFilters.tsx`
  - [ ] `src/interactions/components/PerformanceDashboard.tsx`
  - [ ] `src/interactions/components/InteractionSettings.tsx`
  - [ ] `src/interactions/InteractionTypeSelector.tsx`
  - [ ] `src/interactions/InteractionTimeline.tsx`
  - [ ] `src/interactions/InteractionList.tsx`
  - [ ] `src/interactions/InteractionEmpty.tsx`
  - [ ] `src/interactions/InteractionCreate.tsx`
  - [ ] `src/interactions/InteractionCard.tsx`
  - [ ] `src/interactions/__tests__/InteractionCreate.test.tsx`

---

## 🟠 **Medium Priority (Dashboard, Deals, Customers, Companies)**

- [ ] **Dashboard**
  - [ ] `src/dashboard/NeedsVisitList.tsx`
  - [ ] `src/dashboard/VisitTrends.tsx`
  - [ ] `src/dashboard/LatestNotes.tsx`
  - [ ] `src/dashboard/FollowUpRemindersWidget.tsx`
  - [ ] `src/dashboard/InteractionMetricsCard.tsx`
  - [ ] `src/dashboard/PrincipalPerformanceChart.tsx`

- [ ] **Deals**
  - [ ] `src/deals/OnlyMineInput.tsx`
  - [ ] `src/deals/DealShow.tsx`
  - [ ] `src/deals/DealInputs.tsx`
  - [ ] `src/deals/DealEmpty.tsx`
  - [ ] `src/deals/DealCreate.tsx`
  - [ ] `src/deals/DealArchivedList.tsx`
  - [ ] `src/deals/ContactList.tsx`

- [ ] **Customers**
  - [ ] `src/customers/CustomerImportButton.tsx`

- [ ] **Companies**
  - [ ] `src/companies/CompanyAside.tsx`

---

## 🟣 **Lower Priority (Navigation, Security, Miscellaneous)**

- [ ] **Navigation**
  - [ ] `src/components/navigation/RelationshipBreadcrumbs.tsx`
  - [ ] `src/components/navigation/RelatedEntitiesSection.tsx`
  - [ ] `src/components/TerritoryDisplay.tsx`

- [ ] **Security**
  - [ ] `src/components/security/SessionTimeout.tsx`
  - [ ] `src/components/security/SecurityDashboard.tsx`
  - [ ] `src/components/auth/AuthStatusIndicator.tsx`

---

## ✅ **How to Use This Checklist**

- Work from top to bottom for the smoothest migration.
- Check off each file as you migrate and test it.
- After all are complete, you can safely remove MUI from your dependencies.

---

Would you like to start with the **Shared Components & Utilities** batch, or focus on a different group first?

