Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04745374E73
	for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 19:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788203235; cv=none; b=hiUJ38PURThyRD3dzXJ8vsFUrKQ/8jEFzl4uL++k4vIthNdFkGpySIWyKqbLDOiYWwqgjM9LLm4l6E76VsRLjK7ftD58lI9BJaH5ipov7K+D9UaLwi8YkGSI3dooS7kCOaLSLGUNvzK5mKbcO552oZzwfBiD49/OAWugVYhOoLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788203235; c=relaxed/simple;
	bh=YfZqeRZrcJPBWry4Smdt/KH6SXG+19VL5sgSi8beNLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NZyEFJ0daM2puBZ6ysM0m2TXNgNzD8bEzJoYfCb9ELPDc3A/IkCkOKqRhqIB+JUdyskaUWBAQFUv30UB71XgEeYuXgehiteO6PE4iG8p+NUuyxzQhBhemvxiMcxemPcbct1XLS1+CDHhBl7HbT9JGTje2tWSiryI51d6mkjM9VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbY252Ta; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbY252Ta"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc11a905ba5so98029a12.2
        for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 12:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788203233; x=1788808033; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhr6N2Xsb/i2x+PD9jyfBlndkAPLcSMGtFPyBSSzCz0=;
        b=lbY252TajWXIAdXMT9cHAyBMjI7Us/2FqX1X7PupsuM6gKJkWpJrnn7XLtSdyLUYEy
         pL30gyePdQndyIcpq0mWnI+8dB3pbACszuIBJoHOhN4sBCObAGdV0Mfnq9XRmDvg6HE8
         rBRTfPZpQlljbuPpPHwDCx/gWfXiABfuqjLfXZS8/4ZQ/JMSQ6AR+nvWyWsi00u+vQYi
         35VLBP0NSsUTHFDwPcZCzymZ95DiFmDMaXRl5IJY31xbVsnKA2TFGwagmJir+b7FIw00
         WexLfKW2TQp4NqA+Mm7sg9zJJRVPlDyRcG8mDNQNPVQV8cv1E0W+fdU6NZrxXjKbdKeA
         fPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788203233; x=1788808033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hhr6N2Xsb/i2x+PD9jyfBlndkAPLcSMGtFPyBSSzCz0=;
        b=f9TYXqS2dVjc4EX7Qe9uwQKz0GLTj1/l5h5z8wzIAONIV1uWJnTuNxWF9gub4I5FaD
         jAp6sbTgQ7AsFoL5153nZ6QmYdhVkbOPqoW/eEuWpeYFH1Jg3AJVOftEQNZA0605p3PC
         XzWhs3LZilvV0sFVK7PZ8O53Lqc9Eb1YiLP4SuwDRGoZL4RNNbEVg5gVqDqL16DNxG3G
         +6Tmem4Bwm3dAM1aZPmlU3wts9ogApx56nU3vK2tJBEsQwettBAnYG8UNdmqqp/eT90F
         OYkTgr/wezyfn8kBEcOTHyH5xyJgyU1tf/5SXOuQtnm2ZH5zfTaz5DgWtVepEcGLWrkh
         KMxA==
X-Forwarded-Encrypted: i=1; AKwUvBxO0aeXgzpNRK3dNjnyIa4+F2ctXQt0EMQAnBYe2cWHCvewC4YtzLJAlUh+PkUyfx8aEtNN0zQe58yO1w==@lists.linux.dev
X-Gm-Message-State: AFuF++lSvplgxc1PDt+rzkIoaNbOO5K7fuJ8zzVf2Pq/V7Gruk4lkLH9
	1M+usQH6I1tQmf4R+BvPrm+GStxiXO400Zsj3vp1vlI4cv8eTNMQiUbC
X-Gm-Gg: AYBFou2fyceQ8UuP9Rk2/viu1qV3s8MQoR2VQIIjBmJaZS4cBENZpCAwsrrFRjfFPbj
	b4elT6FV021gR88MkG4hNhXcze75x/OvGOlhk26oQkPQS87Jwy+JEvHsrJpzi+QptwVcneAakYv
	wF+7J5bo86pda2Ycph9nnSHnF2tq4SzUsVv4xVeMopkJHiliwXaRx1imUliL5eiHwNRWFHfMCAV
	tJd7HbprkyI5z5W3qT8GkXUulcQwNU47z7otwh4gtsjUt472Q10OpJPZELugoft5c24lDOgaf26
	Trz8OZ5LWAThZGGXmNmhWg7W3iUi9i82zveRn6zGKwIQ0aZHwg+iQgGPUlYyvuHB8gMyfzprTnO
	hTuG11rzEHw0Xa/IO+Egl0gbQKgRiSvs0E9LeqZP14HyhA6iUdPr6YKG+ATuWii6CJzAhyFiqTs
	t9k29I9QyRjJjFYlC8J6h0hC6J6hPA1Hy9o5VZY9acGofBF9QS3ajlf2JQi/b7W+g079UnSlnlO
	uwX0z6OZLwcKc9VYu3Ob8XQlZ+52+cBDaoiB3M=
X-Received: by 2002:a17:90a:e7cd:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-396d0e71ad7mr40889615a91.7.1788203231598;
        Mon, 31 Aug 2026 12:07:11 -0700 (PDT)
Received: from localhost ([2409:40c4:13b:7a31:95ce:ef4b:57cf:6fd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm46219699c88.4.2026.08.31.12.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:07:11 -0700 (PDT)
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathieu Fluhr <mathieu.fluhr@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Subject: [PATCH 2/2] xhci: drop 120ms U3 LFPS wake retry wait from runtime resume
Date: Tue,  1 Sep 2026 00:33:49 +0530
Message-ID: <20260831190349.29590-2-lovekeshsolanki00@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831190349.29590-1-lovekeshsolanki00@gmail.com>
References: <20260831190349.29590-1-lovekeshsolanki00@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On auto resume (is_auto_resume), xhci_resume() used to msleep(120)
when there were suspended USB3 devices and no pending port event,
to give USB3 devices time to resend their U3 LFPS wake (at 100ms
intervals) if the first wake signalling failed.

The hub driver now holds the SS root hub awake for
USB_SS_ROOT_HUB_U0_WAKE_TIME (120ms) after a resume, which covers that
same window and lets the pending port event be picked up through the
normal hub event path. Therefore, this legacy wait in xhci_resume()
is redundant and can be removed.

Cc: stable@vger.kernel.org
Signed-off-by: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
---
 drivers/usb/host/xhci.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a9e47e178c28..b0caba8ebf18 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1083,7 +1083,6 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 	struct xhci_segment	*seg;
 	int			retval = 0;
 	bool			pending_portevent = false;
-	bool			suspended_usb3_devs = false;
 	bool			reset_registers = false;
 
 	if (!hcd->state)
@@ -1245,18 +1244,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 
 	/*
 	 * Resume roothubs only if there are pending events.
-	 * USB 3 devices resend U3 LFPS wake after a 100ms delay if
-	 * the first wake signalling failed, give it that chance if
-	 * there are suspended USB 3 devices.
 	 */
-	if (xhci->usb3_rhub.bus_state.suspended_ports || xhci->usb3_rhub.bus_state.bus_suspended)
-		suspended_usb3_devs = true;
-
 	pending_portevent = xhci_pending_portevent(xhci);
-	if (suspended_usb3_devs && !pending_portevent && is_auto_resume) {
-		msleep(120);
-		pending_portevent = xhci_pending_portevent(xhci);
-	}
 
 	if (pending_portevent) {
 		if (xhci->shared_hcd)
-- 
2.55.0

