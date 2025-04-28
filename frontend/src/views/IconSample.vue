<template>
  <div id="iconSamplePage" class="content-container">
    <h1>Icons list</h1>
    <div class="icon-container">
      <div class="sub-title">System</div>
      <div class="sub-container">
        <div class="icon-content" v-for="(item, index) in systemIcons" :key="index + ''">
          <el-card shadow="hover" class="box"
            ><el-icon size="30"><component :is="item.icon" /> </el-icon>
            <div class="icon-name">{{ item.name }}</div>
          </el-card>
        </div>
      </div>

      <div class="sub-title">Arrow</div>
      <div class="sub-container">
        <div class="icon-content" v-for="(item, index) in arrowIcons" :key="index + ''">
          <el-card shadow="hover" class="box"
            ><el-icon size="30"><component :is="item.icon" /> </el-icon>
            <div class="icon-name">{{ item.name }}</div>
          </el-card>
        </div>
      </div>

      <div class="sub-title">Document</div>
      <div class="sub-container">
        <div class="icon-content" v-for="(item, index) in documentIcons" :key="index + ''">
          <el-card shadow="hover" class="box"
            ><el-icon size="30"><component :is="item.icon" /> </el-icon>
            <div class="icon-name">{{ item.name }}</div>
          </el-card>
        </div>
      </div>

      <div class="sub-title">Media</div>
      <div class="sub-container">
        <div class="icon-content" v-for="(item, index) in mediaIcons" :key="index + ''">
          <el-card shadow="hover" class="box"
            ><el-icon size="30"><component :is="item.icon" /> </el-icon>
            <div class="icon-name">{{ item.name }}</div>
          </el-card>
        </div>
      </div>

      <div class="sub-title">Traffic</div>
      <div class="sub-container">
        <div class="icon-content" v-for="(item, index) in trafficIcons" :key="index + ''">
          <el-card shadow="hover" class="box"
            ><el-icon size="30"><component :is="item.icon" /> </el-icon>
            <div class="icon-name">{{ item.name }}</div>
          </el-card>
        </div>
      </div>

      <div class="sub-title">Food</div>
      <div class="sub-container">
        <div class="icon-content" v-for="(item, index) in foodIcons" :key="index + ''">
          <el-card shadow="hover" class="box"
            ><el-icon size="30"><component :is="item.icon" /> </el-icon>
            <div class="icon-name">{{ item.name }}</div>
          </el-card>
        </div>
      </div>

      <div class="sub-title">Items</div>
      <div class="sub-container">
        <div class="icon-content" v-for="(item, index) in itemIcons" :key="index + ''">
          <el-card shadow="hover" class="box"
            ><el-icon size="30"><component :is="item.icon" /> </el-icon>
            <div class="icon-name">{{ item.name }}</div>
          </el-card>
        </div>
      </div>

      <div class="sub-title">Weather</div>
      <div class="sub-container">
        <div class="icon-content" v-for="(item, index) in weatherIcons" :key="index + ''">
          <el-card shadow="hover" class="box"
            ><el-icon size="30"><component :is="item.icon" /> </el-icon>
            <div class="icon-name">{{ item.name }}</div>
          </el-card>
        </div>
      </div>

      <div class="sub-title">Other</div>
      <div class="sub-container">
        <div class="icon-content" v-for="(item, index) in otherIcons" :key="index + ''">
          <el-card shadow="hover" class="box"
            ><el-icon size="30"><component :is="item.icon" /> </el-icon>
            <div class="icon-name">{{ item.name }}</div>
          </el-card>
        </div>
      </div>
    </div>
  </div>
</template>


<script lang="ts" setup>
import { ref } from 'vue'

const systemIcons = [
  { name: 'Plus', icon: 'Plus' },
  { name: 'Minus', icon: 'Minus' },
  { name: 'CirclePlus', icon: 'CirclePlus' },
  { name: 'Search', icon: 'Search' },
  { name: 'Female', icon: 'Female' },
  { name: 'Male', icon: 'Male' },
  { name: 'Aim', icon: 'Aim' },
  { name: 'House', icon: 'House' },
  { name: 'FullScreen', icon: 'FullScreen' },
  { name: 'Loading', icon: 'Loading' },
  { name: 'Link', icon: 'Link' },
  { name: 'Service', icon: 'Service' },
  { name: 'Pointer', icon: 'Pointer' },
  { name: 'Star', icon: 'Star' },
  { name: 'Notification', icon: 'Notification' },
  { name: 'Connection', icon: 'Connection' },
  { name: 'ChatDotRound', icon: 'ChatDotRound' },
  { name: 'Setting', icon: 'Setting' },
  { name: 'Clock', icon: 'Clock' },
  { name: 'Position', icon: 'Position' },
  { name: 'Discount', icon: 'Discount' },
  { name: 'Odometer', icon: 'Odometer' },
  { name: 'ChatSquare', icon: 'ChatSquare' },
  { name: 'ChatRound', icon: 'ChatRound' },
  { name: 'ChatLineRound', icon: 'ChatLineRound' },
  { name: 'ChatLineSquare', icon: 'ChatLineSquare' },
  { name: 'ChatDotSquare', icon: 'ChatDotSquare' },
  { name: 'View', icon: 'View' },
  { name: 'Hide', icon: 'Hide' },
  { name: 'Unlock', icon: 'Unlock' },
  { name: 'Lock', icon: 'Lock' },
  { name: 'RefreshRight', icon: 'RefreshRight' },
  { name: 'RefreshLeft', icon: 'RefreshLeft' },
  { name: 'Refresh', icon: 'Refresh' },
  { name: 'Bell', icon: 'Bell' },
  { name: 'MuteNotification', icon: 'MuteNotification' },
  { name: 'User', icon: 'User' },
  { name: 'Check', icon: 'Check' },
  { name: 'CircleCheck', icon: 'CircleCheck' },
  { name: 'Warning', icon: 'Warning' },
  { name: 'CircleClose', icon: 'CircleClose' },
  { name: 'Close', icon: 'Close' },
  { name: 'PieChart', icon: 'PieChart' },
  { name: 'More', icon: 'More' },
  { name: 'Compass', icon: 'Compass' },
  { name: 'Filter', icon: 'Filter' },
  { name: 'Switch', icon: 'Switch' },
  { name: 'Select', icon: 'Select' },
  { name: 'SemiSelect', icon: 'SemiSelect' },
  { name: 'CloseBold', icon: 'CloseBold' },
  { name: 'EditPen', icon: 'EditPen' },
  { name: 'Edit', icon: 'Edit' },
  { name: 'Message', icon: 'Message' },
  { name: 'MessageBox', icon: 'MessageBox' },
  { name: 'TurnOff', icon: 'TurnOff' },
  { name: 'Finished', icon: 'Finished' },
  { name: 'Delete', icon: 'Delete' },
  { name: 'Crop', icon: 'Crop' },
  { name: 'SwitchButton', icon: 'SwitchButton' },
  { name: 'Operation', icon: 'Operation' },
  { name: 'Open', icon: 'Open' },
  { name: 'Remove', icon: 'Remove' },
  { name: 'ZoomOut', icon: 'ZoomOut' },
  { name: 'ZoomIn', icon: 'ZoomIn' },
  { name: 'InfoFilled', icon: 'InfoFilled' },
  { name: 'CircleCheckFilled', icon: 'CircleCheckFilled' },
  { name: 'SuccessFilled', icon: 'SuccessFilled' },
  { name: 'WarningFilled', icon: 'WarningFilled' },
  { name: 'CircleCloseFilled', icon: 'CircleCloseFilled' },
  { name: 'QuestionFilled', icon: 'QuestionFilled' },
  { name: 'WarnTriangleFilled', icon: 'WarnTriangleFilled' },
  { name: 'UserFilled', icon: 'UserFilled' },
  { name: 'MoreFilled', icon: 'MoreFilled' },
  { name: 'Tools', icon: 'Tools' },
  { name: 'HomeFilled', icon: 'HomeFilled' },
  { name: 'Menu', icon: 'Menu' },
  { name: 'UploadFilled', icon: 'UploadFilled' },
  { name: 'Avatar', icon: 'Avatar' },
  { name: 'HelpFilled', icon: 'HelpFilled' },
  { name: 'Share', icon: 'Share' },
  { name: 'StarFilled', icon: 'StarFilled' },
  { name: 'Comment', icon: 'Comment' },
  { name: 'Histogram', icon: 'Histogram' },
  { name: 'Grid', icon: 'Grid' },
  { name: 'Promotion', icon: 'Promotion' },
  { name: 'DeleteFilled', icon: 'DeleteFilled' },
  { name: 'RemoveFilled', icon: 'RemoveFilled' },
  { name: 'CirclePlusFilled', icon: 'CirclePlusFilled' }
]
const arrowIcons = [
  { name: 'ArrowLeft', icon: 'ArrowLeft' },
  { name: 'ArrowUp', icon: 'ArrowUp' },
  { name: 'ArrowRight', icon: 'ArrowRight' },
  { name: 'ArrowDown', icon: 'ArrowDown' },
  { name: 'ArrowLeftBold', icon: 'ArrowLeftBold' },
  { name: 'ArrowUpBold', icon: 'ArrowUpBold' },
  { name: 'ArrowRightBold', icon: 'ArrowRightBold' },
  { name: 'ArrowDownBold', icon: 'ArrowDownBold' },
  { name: 'DArrowRight', icon: 'DArrowRight' },
  { name: 'DArrowLeft', icon: 'DArrowLeft' },
  { name: 'Download', icon: 'Download' },
  { name: 'Upload', icon: 'Upload' },
  { name: 'Top', icon: 'Top' },
  { name: 'Bottom', icon: 'Bottom' },
  { name: 'Back', icon: 'Back' },
  { name: 'Right', icon: 'Right' },
  { name: 'TopRight', icon: 'TopRight' },
  { name: 'TopLeft', icon: 'TopLeft' },
  { name: 'BottomRight', icon: 'BottomRight' },
  { name: 'BottomLeft', icon: 'BottomLeft' },
  { name: 'Sort', icon: 'Sort' },
  { name: 'SortUp', icon: 'SortUp' },
  { name: 'SortDown', icon: 'SortDown' },
  { name: 'Rank', icon: 'Rank' },
  { name: 'CaretLeft', icon: 'CaretLeft' },
  { name: 'CaretTop', icon: 'CaretTop' },
  { name: 'CaretRight', icon: 'CaretRight' },
  { name: 'CaretBottom', icon: 'CaretBottom' },
  { name: 'DCaret', icon: 'DCaret' },
  { name: 'Expand', icon: 'Expand' },
  { name: 'Fold', icon: 'Fold' }
]
const documentIcons = [
  { name: 'DocumentAdd', icon: 'DocumentAdd' },
  { name: 'Document', icon: 'Document' },
  { name: 'Notebook', icon: 'Notebook' },
  { name: 'Tickets', icon: 'Tickets' },
  { name: 'Memo', icon: 'Memo' },
  { name: 'Collection', icon: 'Collection' },
  { name: 'Postcard', icon: 'Postcard' },
  { name: 'ScaleToOriginal', icon: 'ScaleToOriginal' },
  { name: 'SetUp', icon: 'SetUp' },
  { name: 'DocumentDelete', icon: 'DocumentDelete' },
  { name: 'DocumentChecked', icon: 'DocumentChecked' },
  { name: 'DataBoard', icon: 'DataBoard' },
  { name: 'DataAnalysis', icon: 'DataAnalysis' },
  { name: 'CopyDocument', icon: 'CopyDocument' },
  { name: 'FolderChecked', icon: 'FolderChecked' },
  { name: 'Files', icon: 'Files' },
  { name: 'Folder', icon: 'Folder' },
  { name: 'FolderDelete', icon: 'FolderDelete' },
  { name: 'FolderRemove', icon: 'FolderRemove' },
  { name: 'FolderOpened', icon: 'FolderOpened' },
  { name: 'DocumentCopy', icon: 'DocumentCopy' },
  { name: 'DocumentRemove', icon: 'DocumentRemove' },
  { name: 'FolderAdd', icon: 'FolderAdd' },
  { name: 'FirstAidKit', icon: 'FirstAidKit' },
  { name: 'Reading', icon: 'Reading' },
  { name: 'DataLine', icon: 'DataLine' },
  { name: 'Management', icon: 'Management' },
  { name: 'Checked', icon: 'Checked' },
  { name: 'Ticket', icon: 'Ticket' },
  { name: 'Failed', icon: 'Failed' },
  { name: 'TrendCharts', icon: 'TrendCharts' },
  { name: 'List', icon: 'List' }
]
const mediaIcons = [
  { name: 'Microphone', icon: 'Microphone' },
  { name: 'Mute', icon: 'Mute' },
  { name: 'Mic', icon: 'Mic' },
  { name: 'VideoPause', icon: 'VideoPause' },
  { name: 'VideoCamera', icon: 'VideoCamera' },
  { name: 'VideoPlay', icon: 'VideoPlay' },
  { name: 'Headset', icon: 'Headset' },
  { name: 'Monitor', icon: 'Monitor' },
  { name: 'Film', icon: 'Film' },
  { name: 'Camera', icon: 'Camera' },
  { name: 'Picture', icon: 'Picture' },
  { name: 'PictureRounded', icon: 'PictureRounded' },
  { name: 'Iphone', icon: 'Iphone' },
  { name: 'Cellphone', icon: 'Cellphone' },
  { name: 'VideoCameraFilled', icon: 'VideoCameraFilled' },
  { name: 'PictureFilled', icon: 'PictureFilled' },
  { name: 'Platform', icon: 'Platform' },
  { name: 'CameraFilled', icon: 'CameraFilled' },
  { name: 'BellFilled', icon: 'BellFilled' }
]
const trafficIcons = [
  { name: 'Location', icon: 'Location' },
  { name: 'LocationInformation', icon: 'LocationInformation' },
  { name: 'DeleteLocation', icon: 'DeleteLocation' },
  { name: 'Coordinate', icon: 'Coordinate' },
  { name: 'Bicycle', icon: 'Bicycle' },
  { name: 'OfficeBuilding', icon: 'OfficeBuilding' },
  { name: 'School', icon: 'School' },
  { name: 'Guide', icon: 'Guide' },
  { name: 'AddLocation', icon: 'AddLocation' },
  { name: 'MapLocation', icon: 'MapLocation' },
  { name: 'Place', icon: 'Place' },
  { name: 'LocationFilled', icon: 'LocationFilled' },
  { name: 'Van', icon: 'Van' }
]
const foodIcons = [
  { name: 'Watermelon', icon: 'Watermelon' },
  { name: 'Pear', icon: 'Pear' },
  { name: 'NoSmoking', icon: 'NoSmoking' },
  { name: 'Smoking', icon: 'Smoking' },
  { name: 'Mug', icon: 'Mug' },
  { name: 'GobletSquareFull', icon: 'GobletSquareFull' },
  { name: 'GobletFull', icon: 'GobletFull' },
  { name: 'KnifeFork', icon: 'KnifeFork' },
  { name: 'Sugar', icon: 'Sugar' },
  { name: 'Bowl', icon: 'Bowl' },
  { name: 'MilkTea', icon: 'MilkTea' },
  { name: 'Lollipop', icon: 'Lollipop' },
  { name: 'Coffee', icon: 'Coffee' },
  { name: 'Chicken', icon: 'Chicken' },
  { name: 'Dish', icon: 'Dish' },
  { name: 'IceTea', icon: 'IceTea' },
  { name: 'ColdDrink', icon: 'ColdDrink' },
  { name: 'CoffeeCup', icon: 'CoffeeCup' },
  { name: 'DishDot', icon: 'DishDot' },
  { name: 'IceDrink', icon: 'IceDrink' },
  { name: 'IceCream', icon: 'IceCream' },
  { name: 'Dessert', icon: 'Dessert' },
  { name: 'IceCreamSquare', icon: 'IceCreamSquare' },
  { name: 'ForkSpoon', icon: 'ForkSpoon' },
  { name: 'IceCreamRound', icon: 'IceCreamRound' },
  { name: 'Food', icon: 'Food' },
  { name: 'HotWater', icon: 'HotWater' },
  { name: 'Grape', icon: 'Grape' },
  { name: 'Fries', icon: 'Fries' },
  { name: 'Apple', icon: 'Apple' },
  { name: 'Burger', icon: 'Burger' },
  { name: 'Goblet', icon: 'Goblet' },
  { name: 'GobletSquare', icon: 'GobletSquare' },
  { name: 'Orange', icon: 'Orange' },
  { name: 'Cherry', icon: 'Cherry' }
]
const itemIcons = [
  { name: 'Printer', icon: 'Printer' },
  { name: 'Calendar', icon: 'Calendar' },
  { name: 'CreditCard', icon: 'CreditCard' },
  { name: 'Box', icon: 'Box' },
  { name: 'Money', icon: 'Money' },
  { name: 'Refrigerator', icon: 'Refrigerator' },
  { name: 'Cpu', icon: 'Cpu' },
  { name: 'Football', icon: 'Football' },
  { name: 'Brush', icon: 'Brush' },
  { name: 'Suitcase', icon: 'Suitcase' },
  { name: 'SuitcaseLine', icon: 'SuitcaseLine' },
  { name: 'Umbrella', icon: 'Umbrella' },
  { name: 'AlarmClock', icon: 'AlarmClock' },
  { name: 'Medal', icon: 'Medal' },
  { name: 'GoldMedal', icon: 'GoldMedal' },
  { name: 'Present', icon: 'Present' },
  { name: 'Mouse', icon: 'Mouse' },
  { name: 'Watch', icon: 'Watch' },
  { name: 'QuartzWatch', icon: 'QuartzWatch' },
  { name: 'Magnet', icon: 'Magnet' },
  { name: 'Help', icon: 'Help' },
  { name: 'Soccer', icon: 'Soccer' },
  { name: 'ToiletPaper', icon: 'ToiletPaper' },
  { name: 'ReadingLamp', icon: 'ReadingLamp' },
  { name: 'Paperclip', icon: 'Paperclip' },
  { name: 'MagicStick', icon: 'MagicStick' },
  { name: 'Basketball', icon: 'Basketball' },
  { name: 'Baseball', icon: 'Baseball' },
  { name: 'Coin', icon: 'Coin' },
  { name: 'Goods', icon: 'Goods' },
  { name: 'Sell', icon: 'Sell' },
  { name: 'SoldOut', icon: 'SoldOut' },
  { name: 'Key', icon: 'Key' },
  { name: 'ShoppingCart', icon: 'ShoppingCart' },
  { name: 'ShoppingCartFull', icon: 'ShoppingCartFull' },
  { name: 'ShoppingTrolley', icon: 'ShoppingTrolley' },
  { name: 'Phone', icon: 'Phone' },
  { name: 'Scissor', icon: 'Scissor' },
  { name: 'Handbag', icon: 'Handbag' },
  { name: 'ShoppingBag', icon: 'ShoppingBag' },
  { name: 'Trophy', icon: 'Trophy' },
  { name: 'TrophyBase', icon: 'TrophyBase' },
  { name: 'Stopwatch', icon: 'Stopwatch' },
  { name: 'Timer', icon: 'Timer' },
  { name: 'CollectionTag', icon: 'CollectionTag' },
  { name: 'TakeawayBox', icon: 'TakeawayBox' },
  { name: 'PriceTag', icon: 'PriceTag' },
  { name: 'Wallet', icon: 'Wallet' },
  { name: 'Opportunity', icon: 'Opportunity' },
  { name: 'PhoneFilled', icon: 'PhoneFilled' },
  { name: 'WalletFilled', icon: 'WalletFilled' },
  { name: 'GoodsFilled', icon: 'GoodsFilled' },
  { name: 'Flag', icon: 'Flag' },
  { name: 'BrushFilled', icon: 'BrushFilled' },
  { name: 'Briefcase', icon: 'Briefcase' },
  { name: 'Stamp', icon: 'Stamp' }
]
const weatherIcons = [
  { name: 'Sunrise', icon: 'Sunrise' },
  { name: 'Sunny', icon: 'Sunny' },
  { name: 'Ship', icon: 'Ship' },
  { name: 'MostlyCloudy', icon: 'MostlyCloudy' },
  { name: 'PartlyCloudy', icon: 'PartlyCloudy' },
  { name: 'Sunset', icon: 'Sunset' },
  { name: 'Drizzling', icon: 'Drizzling' },
  { name: 'Pouring', icon: 'Pouring' },
  { name: 'Cloudy', icon: 'Cloudy' },
  { name: 'Moon', icon: 'Moon' },
  { name: 'MoonNight', icon: 'MoonNight' },
  { name: 'Lightning', icon: 'Lightning' }
]
const otherIcons = [
  { name: 'ChromeFilled', icon: 'ChromeFilled' },
  { name: 'Eleme', icon: 'Eleme' },
  { name: 'ElemeFilled', icon: 'ElemeFilled' },
  { name: 'ElementPlus', icon: 'ElementPlus' },
  { name: 'Shop', icon: 'Shop' },
  { name: 'SwitchFilled', icon: 'SwitchFilled' },
  { name: 'WindPower', icon: 'WindPower' }
]
</script>
<style lang="less" scoped>
.icon-container {
  display: flex;
  flex-direction: column;
  flex-wrap: wrap;
  width: 100%;
  height: 100%;
  align-items: flex-start;
  justify-content: space-evenly;
}
.sub-title {
  font-size: 24px;
  font-weight: bold;
  margin: 24px 0;
  float: left;
}

.sub-container {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: row;
  overflow: auto;
  flex-wrap: wrap;
}

.icon-content {
  margin: 0.5rem;
}

.box {
  min-width: 100px;
  text-align: center;
}
.icon-name {
  font-size: 1rem;
  margin-top: 1rem;
}
</style>

