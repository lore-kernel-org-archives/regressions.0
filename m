Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346493E717E;
	Thu, 23 Apr 2026 11:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776943535; cv=none; b=tBB2VmStgfboa9SpfIeHLrOIYPKfX/98jmwaRH0b5Hn9Pnx1ZpmgxRNSXxxBlkC+X01JhRzDAY4qQyYbZzG82M7vBkfDwKVlTTjPZFWsZANltO8vz1IdxbHOKpI2k2O9qz/MwSaqgDyQ9Wtb9ntgw3GawbcvOA9Lvr8lySw6TNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776943535; c=relaxed/simple;
	bh=Yto2QYPoQuNTPo086h8PDR/WFkwk3TiYFcS76h/c8ys=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=BsOEk1hPXP3smotECofjxbaz2ZSWz6xcs9cExpbUHrkJt//GPVqLpip8R4vTGDuQ5gJ54VT26gyxs9HGE4PivCxvXiaupilIetjHxJT2gAxDWHKoql80JR8N2/6QfRadK7KWjnJ1mptzxhNxBFRzhU3uc/pHl9iYn8K628xX+uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lb9Ve0QE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lb9Ve0QE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACF3C2BCAF;
	Thu, 23 Apr 2026 11:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776943534;
	bh=Yto2QYPoQuNTPo086h8PDR/WFkwk3TiYFcS76h/c8ys=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=lb9Ve0QESvXA4qlc6uIyjeTmmSpfpUeLcYMIj+MlD+tnJObeRXWNSfvxh5eNGT5zz
	 hPy9LompX9BtozMI5XlZ0uhoQIEhjK0qommrzd7voVclKieMNvjkyOZp74Ywip7ybS
	 a4m45fZcuc4nGS9t+PIWTM9DF85Rnl0vrRsXJUmo=
Subject: Patch "Revert "wifi: cfg80211: stop NAN and P2P in cfg80211_leave"" has been added to the 6.1-stable tree
To: gregkh@linuxfoundation.org,guocai.he.cn@windriver.com,johannes.berg@intel.com,miriam.rachel.korenblit@intel.com,regressions@lists.linux.dev
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 23 Apr 2026 13:24:44 +0200
In-Reply-To: <20260414021633.2765982-1-guocai.he.cn@windriver.com>
Message-ID: <2026042343-unhearing-thee-53d1@gregkh>
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

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-wifi-cfg80211-stop-nan-and-p2p-in-cfg80211_leave.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From regressions+bounces-16329-greg=kroah.com@lists.linux.dev Tue Apr 14 04:17:08 2026
From: guocai.he.cn@windriver.com
Date: Tue, 14 Apr 2026 10:16:33 +0800
Subject: Revert "wifi: cfg80211: stop NAN and P2P in cfg80211_leave"
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org, johannes.berg@intel.com, netdev@vger.kernel.org, regressions@lists.linux.dev, miriam.rachel.korenblit@intel.com
Message-ID: <20260414021633.2765982-1-guocai.he.cn@windriver.com>

From: Guocai He <guocai.he.cn@windriver.com>

This reverts commit 0c4f1c02d27a880b10b58c63f574f13bed4f711d which is commit 
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
@@ -1328,10 +1328,8 @@ void __cfg80211_leave(struct cfg80211_re
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

queue-6.1/revert-wifi-cfg80211-stop-nan-and-p2p-in-cfg80211_leave.patch
