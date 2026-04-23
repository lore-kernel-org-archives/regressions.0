Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8CE364036;
	Thu, 23 Apr 2026 11:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776943398; cv=none; b=A9JSwYvnnLKGgJZ6k7ZLeajZEmFLo8VQJL2X6HtkEwDjXKR1G2S/gREv5k8mQNCTJi9vS/1bURL89/dHp8hptqBOzN7Q9+hOdO4C98PWf/jD0pHB4LbuH+VT77IbVQOLoiVtu0bqkflkMnWpfqAV9SAlSY3bCyzvKGKGfEq1RE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776943398; c=relaxed/simple;
	bh=hALwEpxElMh+0n334blyLdBXCyegFxY6aK090NiYLtQ=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=mip6UWy21uQj2NUXg03WeyhCJKH6ZWYZT+y/gWrS84Xm9pkLnxRHIrDFoVlTIHNl15EzBGy2rpUDi3g1NdTjPov5YdIXUka8xnbO3Tk9LeZC86XJSQzJ53TMvtuDeQQy4yzgetIvrmktuRXVSvU6tdglrBikCOQwN/12V2RNdyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=r8CBVmLa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="r8CBVmLa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E57C2BCAF;
	Thu, 23 Apr 2026 11:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776943398;
	bh=hALwEpxElMh+0n334blyLdBXCyegFxY6aK090NiYLtQ=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=r8CBVmLaMiSohlBwW5VuQvGEBFQT3isHWgjV/wZAcnslnO/ZUoDc8SluG9YwkAD9e
	 wMDlWIiSBoZyrCnYZaaiKrA1ysOi7IXdIQncEllce3KMHoV4SPvOZ7B1VlEg023SDX
	 UwUEA9oj5Na9ywkkYaQ61VXnXLRpBqertbqhA1Eg=
Subject: Patch "Revert "wifi: cfg80211: stop NAN and P2P in cfg80211_leave"" has been added to the 6.6-stable tree
To: gregkh@linuxfoundation.org,guocai.he.cn@windriver.com,johannes.berg@intel.com,miriam.rachel.korenblit@intel.com,regressions@lists.linux.dev
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 23 Apr 2026 13:23:00 +0200
In-Reply-To: <20260414024634.2826229-1-guocai.he.cn@windriver.com>
Message-ID: <2026042300-bubble-shaky-0655@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    Revert "wifi: cfg80211: stop NAN and P2P in cfg80211_leave"

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-wifi-cfg80211-stop-nan-and-p2p-in-cfg80211_leave.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-237706-greg=kroah.com@vger.kernel.org Tue Apr 14 04:47:26 2026
From: guocai.he.cn@windriver.com
Date: Tue, 14 Apr 2026 10:46:34 +0800
Subject: Revert "wifi: cfg80211: stop NAN and P2P in cfg80211_leave"
To: gregkh@linuxfoundation.org
Cc: stable@vger.kernel.org, johannes.berg@intel.com, netdev@vger.kernel.org, regressions@lists.linux.dev, miriam.rachel.korenblit@intel.com, linux-kernel@vger.kernel.org
Message-ID: <20260414024634.2826229-1-guocai.he.cn@windriver.com>

From: Guocai He <guocai.he.cn@windriver.com>

This reverts commit 4d7a05da767e5cbcf4db511b9289d7ebd380dc56 which is commit
e1696c8bd0056bc1a5f7766f58ac333adc203e8a upstream.

The reverted patch introduced a deadlock. The locking situation in mainline is
totally different, so it is incorrect to directly backport the commit from mainline.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 net/wireless/core.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

--- a/net/wireless/core.c
+++ b/net/wireless/core.c
@@ -1332,10 +1332,8 @@ void __cfg80211_leave(struct cfg80211_re
 		__cfg80211_leave_ocb(rdev, dev);
 		break;
 	case NL80211_IFTYPE_P2P_DEVICE:
-		cfg80211_stop_p2p_device(rdev, wdev);
-		break;
 	case NL80211_IFTYPE_NAN:
-		cfg80211_stop_nan(rdev, wdev);
+		/* cannot happen, has no netdev */
 		break;
 	case NL80211_IFTYPE_AP_VLAN:
 	case NL80211_IFTYPE_MONITOR:


Patches currently in stable-queue which might be from guocai.he.cn@windriver.com are

queue-6.6/revert-wifi-cfg80211-stop-nan-and-p2p-in-cfg80211_leave.patch
