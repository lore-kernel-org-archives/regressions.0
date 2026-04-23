Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3623E9F8E;
	Thu, 23 Apr 2026 11:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945357; cv=none; b=eKvL33QEKDpWtD5mjZAJjQlJynyYv6WDcJzFiXmZz7Um9arzGeSuxLjR+j97JbaWcGC4kFruTOfdXKUZUPbzNKpNTrBo/adNnR87bHwPVfPmzDNUyw1XnpTU35T5t8ncMucLtNl1O4WbASPdIvDPfpF3kcub9mQK8uhokh5cZfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945357; c=relaxed/simple;
	bh=CD3tUOMu4RycfIX8q9LpzgLG6HMq++vnOBjZCPZFxiE=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=Jmkxwxy048Tnzu9HMc5LcVGhXI4NrQ1YyIQf4x1HfcSz3ETWI4+xpG2VCUEwdyAak7ydzY5lqT8sgOA7f9i2fKCvPVLoj9/g52BsyMnPju/Z0KqGBmusyoujGUwwSZEeu4FAZPt1tFOf5dfxaUxID5wjJCI2F02aM46QtZ641AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dkj2BNZx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dkj2BNZx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B801EC2BCAF;
	Thu, 23 Apr 2026 11:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776945357;
	bh=CD3tUOMu4RycfIX8q9LpzgLG6HMq++vnOBjZCPZFxiE=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=dkj2BNZxfrTdibejAhBEqn4/lmO+nbp0W84otx4NanSr+XwR10a5qmCqM3qORNh5D
	 KwqU0Hn8PS4Il4QV1Mb6N2k67rxBO/HKQc4erSo6sJI7AB7uTpo+VGN0MxKBZBQ38W
	 fAW2gl6OjBdk013pFF6z1hLg8IdwAdWjVY3AExVI=
Subject: Patch "Revert "wifi: cfg80211: stop NAN and P2P in cfg80211_leave"" has been added to the 5.15-stable tree
To: gregkh@linuxfoundation.org,guocai.he.cn@windriver.com,johannes.berg@intel.com,miriam.rachel.korenblit@intel.com,regressions@lists.linux.dev
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 23 Apr 2026 13:55:29 +0200
In-Reply-To: <20260414032006.2887625-1-guocai.he.cn@windriver.com>
Message-ID: <2026042329-broadness-starlight-450b@gregkh>
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

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-wifi-cfg80211-stop-nan-and-p2p-in-cfg80211_leave.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From prvs=8564c0333c=guocai.he.cn@windriver.com Tue Apr 14 05:20:35 2026
From: guocai.he.cn@windriver.com
Date: Tue, 14 Apr 2026 11:20:06 +0800
Subject: Revert "wifi: cfg80211: stop NAN and P2P in cfg80211_leave"
To: gregkh@linuxfoundation.org
Cc: stable@vger.kernel.org, johannes.berg@intel.com, netdev@vger.kernel.org, regressions@lists.linux.dev, miriam.rachel.korenblit@intel.com, linux-kernel@vger.kernel.org
Message-ID: <20260414032006.2887625-1-guocai.he.cn@windriver.com>

From: Guocai He <guocai.he.cn@windriver.com>

This reverts commit 31344ffecd7a34335ce2b52e8c205bce3cbfca4b which is commit
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
@@ -1300,10 +1300,8 @@ void __cfg80211_leave(struct cfg80211_re
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

queue-5.15/revert-wifi-cfg80211-stop-nan-and-p2p-in-cfg80211_leave.patch
