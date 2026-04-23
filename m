Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A086836B040;
	Thu, 23 Apr 2026 12:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776946167; cv=none; b=KbP4Cl65FNIPb4C6JPCtRKNQe3TVtETs4fQjxSA8z2pQRXHRslXJXsK7CCsGL0gYyM/BOQ8JmwR7NvJEHFkx7/eCor4B2oEzYgwEeqF0gjuYHQQMqye309CeUoKGiQAcLNLdTisoTv99eKXniAut9BtKs4CZsP7XtEczvQ5Inug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776946167; c=relaxed/simple;
	bh=fxEMg3cU6Jyvq79gYEgvOsL/dyxR30kgElezDlbnMWs=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=cQNU1n7S6BQj754XGYm0WjB7xGwr3IxcUcrD+20FkVi6V9uKZCzVmEYamp0QCYEjVFEUWNnly3162omu6N3sMjkmXaJfE+NLYKcDLtgbrYKsp85V8N7+W2o8ca3BBOpNmirEzuurUPUzke7T3ww9k3CIO2UqeG65Va3/mO19Hnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=o6LuDXZU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="o6LuDXZU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B62C2BCAF;
	Thu, 23 Apr 2026 12:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776946167;
	bh=fxEMg3cU6Jyvq79gYEgvOsL/dyxR30kgElezDlbnMWs=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=o6LuDXZURKBmjBAJnzUGlGfMXgulGYm15NNiV0GPBZ/idZHl2bBMpdRMm+uBZNU7k
	 +5X6E/hCZP/vGaIAoZAq0YddTpBUR4E6JiqefPVjbacKgEPcQrLg3z84DtocCYgroJ
	 tGwXwg4nUsgEoEXzce6wxJG6buxyh5HytzNF7TSg=
Subject: Patch "Revert "wifi: cfg80211: stop NAN and P2P in cfg80211_leave"" has been added to the 5.10-stable tree
To: gregkh@linuxfoundation.org,guocai.he.cn@windriver.com,johannes.berg@intel.com,miriam.rachel.korenblit@intel.com,regressions@lists.linux.dev
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 23 Apr 2026 14:08:46 +0200
In-Reply-To: <20260414040349.2974854-1-guocai.he.cn@windriver.com>
Message-ID: <2026042346-subsonic-strategic-0afd@gregkh>
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

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-wifi-cfg80211-stop-nan-and-p2p-in-cfg80211_leave.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From regressions+bounces-16332-greg=kroah.com@lists.linux.dev Tue Apr 14 06:04:19 2026
From: guocai.he.cn@windriver.com
Date: Tue, 14 Apr 2026 12:03:49 +0800
Subject: Revert "wifi: cfg80211: stop NAN and P2P in cfg80211_leave"
To: gregkh@linuxfoundation.org
Cc: stable@vger.kernel.org, johannes.berg@intel.com, netdev@vger.kernel.org, regressions@lists.linux.dev, miriam.rachel.korenblit@intel.com, linux-kernel@vger.kernel.org
Message-ID: <20260414040349.2974854-1-guocai.he.cn@windriver.com>

From: Guocai He <guocai.he.cn@windriver.com>

This reverts commit d91240f24e831d3bd36954599ada6b456fb1bd0a which is commit
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
@@ -1119,10 +1119,8 @@ static void __cfg80211_unregister_wdev(s
 
 	switch (wdev->iftype) {
 	case NL80211_IFTYPE_P2P_DEVICE:
-		cfg80211_stop_p2p_device(rdev, wdev);
-		break;
 	case NL80211_IFTYPE_NAN:
-		cfg80211_stop_nan(rdev, wdev);
+		/* cannot happen, has no netdev */
 		break;
 	default:
 		break;


Patches currently in stable-queue which might be from guocai.he.cn@windriver.com are

queue-5.10/revert-wifi-cfg80211-stop-nan-and-p2p-in-cfg80211_leave.patch
queue-5.10/revert-wifi-cfg80211-stop-nan-and-p2p-in-cfg80211_le.patch
