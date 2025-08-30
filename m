Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ADB245005
	for <regressions@lists.linux.dev>; Sat, 30 Aug 2025 09:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756547318; cv=none; b=ENFey2N/HJOxuMAJ/lwx1wVgj6RkPn06+a+DFJM5Chit5ErvncgDqSWYyHNJPcy1/XggTPUNxDCihWMC//nbsbclR8qTlSatfkYa66YsJBSvtuzHxu6MZ6G65KRoLOknyomzGj8++9mH8zZFEHztMpZuDX/EsxFKfObU6Cz9JmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756547318; c=relaxed/simple;
	bh=WrBzWUBbNLVi1TVHVDGcJFK1o+XYYsxTimvrazHOL+0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a7UXuVnhfwAQC5+c4EQqmLsvyFKaAz/EO4fe6lkYlDKQiMcGc3QwIOXignPsPoOIs8YDESLb5NpyNCicrNAVbJWUt09SSitNZyl6HJneHPuj2TnD/V4C5A/wHAVoFY2XBTXTNIlQLYNi9fGuK6QIUak1x+qUnSVsWmseDwRUSE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ch5ORZXJ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ch5ORZXJ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so2653188e87.0
        for <regressions@lists.linux.dev>; Sat, 30 Aug 2025 02:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756547314; x=1757152114; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dp4t+5XjcUN448FoaeZJP4HhV6YJjFsdimtWRYF00KI=;
        b=Ch5ORZXJgwXEzHubNimqzfroXE/wAhwKbpsfDzu16b3GieCiFxWy9VXuPnoMatyuJg
         we12O15DJj7cJoc7c5f+2hvdocKzLlD7JnkYszbYeZY3BeRlOF9/ASaMtdyhJj6HkmOM
         8l4/DjW3OPsMwVZn08MrF4yGSBiA8PFGVL22tucnyQ4ikHg1lur8Kub0/YW0xeYwtmAe
         +pMiMLZOKuSUmM9NH8lQThoLJLbKXE8XP83vHSeZTU8h3N5NiWet1vWiW2sT7CkZq20J
         fhDvkrWvIsiowDdKq5x+0Wk9w6mKWuo7qU6HUq+19d6te+RiOC3GnBtTd6M0onKmTUeq
         trbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756547314; x=1757152114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dp4t+5XjcUN448FoaeZJP4HhV6YJjFsdimtWRYF00KI=;
        b=IPEMgBx/yowgaapaqMdFPyVvHLf8GcaL0KSwK26zUpwOP2Bh/WZ7HPeJvYELDB9sr4
         Fd27RdRzM4OCZVBt58UDj6YaxgQZX5a6hRadCQticN6cMLNkBIQpt2Gc1Bt9sI0nEDe8
         HfqiELwJHfpnwAR7HUCi9l8STwtmXJfL5mRuRUNHwm6/oz/O1HWe2Aqbs2DAWO2UOUtq
         uyYYSQ/7xkOdMs23cpp+/zElDbMMD8E7qmgdAnA27Udt0ugQr9AJV2JeHernMA+87GHb
         XICYOIWO+RbcJeeexfTtQDFyRG+phH2KRiygXUSjq5TeL7QRiJjYzKbUp7yZQ/TGO5mr
         yocQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbTe57S/H3R1NYWdB3+Bt2lL9NLUZbolMf5PLE0VAzHr1V8qP6dCm5ka+N7nbLqVxRGbr1OZtawwdwTw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwriHrq2bg1xegHhMfWjZzokbcuYuA1NihLo5IGYY3yOYqNckjN
	fxVc9QA8LLSrhKpxpEc7GQ7ls9B9IEnVR8l4Rxc0g+qPYBtKZCnkimCL
X-Gm-Gg: ASbGncvTGRmaouvd54ECaihimNwfX09qaAXpSVewgXd5uTr/2q1tdTamJPgrhLSQLoJ
	k2/apzm7VnSQvXyXl/ZE2o+EuVjFjt82jvDLW2j+S+JBUT0Y/0/Cg63O7BLjmgFv9BD9vv7fb1j
	KRBFBSyrde2i7uQnmcK9RFKEiQd7JuSPnQaIWCchNIYjl2aqI3W4IEFt4Jx1J+R+TxjTqG6wZWJ
	tcVnhgHpFhYqB7QHoLsK1LUDxSxXRkOzBccN4hzqYT3VxQihPX8Bbiw74OLXTvQt2mmwZB5l2IW
	5ToRRH44rZmao4JA52A48TRb5IVmuzNvTYugxTG7w8ASoFnWDVKJrJYtcZo83tHXfQ1jPSq71cW
	Roii3efVfnNFftQrL4DuDHaOOZRkDIFHS0l2bGaMA/dN+Dg==
X-Google-Smtp-Source: AGHT+IGdB28Kgve/k09nulGg5xE5ZB+QMPE3o6zmbFp9NBmgjzvdnMtt6dfwBVuvpO1a7qA3If8MlQ==
X-Received: by 2002:a05:6512:6812:b0:55f:4a34:e333 with SMTP id 2adb3069b0e04-55f708ecf28mr337051e87.33.1756547313289;
        Sat, 30 Aug 2025 02:48:33 -0700 (PDT)
Received: from foxbook (bhd106.neoplus.adsl.tpnet.pl. [83.28.93.106])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dd6e2sm1299335e87.23.2025.08.30.02.48.32
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 30 Aug 2025 02:48:32 -0700 (PDT)
Date: Sat, 30 Aug 2025 11:48:28 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: David Wang <00107082@163.com>
Cc: WeitaoWang-oc@zhaoxin.com, mathias.nyman@linux.intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 surenb@google.com, kent.overstreet@linux.dev
Subject: Re: [REGRESSION 6.17-rc3] usb/xhci: possible memory leak after
 suspend/resume cycle.
Message-ID: <20250830114828.3dd8ed56.michal.pecio@gmail.com>
In-Reply-To: <20250829181354.4450-1-00107082@163.com>
References: <20250829181354.4450-1-00107082@163.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 30 Aug 2025 02:13:54 +0800, David Wang wrote:
> Hi,
>
> I have been watching kernel memory usage for drivers for a while, via /proc/allocinfo.
> After upgrade to 6.17-rc3, I notice memory usage behavior changes for usb drivers:
> 
> Before rc3, after several suspend/resume cycles, usb devices's memory usage is very stable:
> 
>        40960        5 drivers/usb/host/xhci-mem.c:980 [xhci_hcd] func:xhci_alloc_virt_device 9
>         1024        1 drivers/usb/host/xhci-mem.c:841 [xhci_hcd] func:xhci_alloc_tt_info 2
>          320       10 drivers/usb/host/xhci-mem.c:461 [xhci_hcd] func:xhci_alloc_container_ctx 31
>         1920       15 drivers/usb/host/xhci-mem.c:377 [xhci_hcd] func:xhci_ring_alloc 31
>          112       12 drivers/usb/host/xhci-mem.c:49 [xhci_hcd] func:xhci_segment_alloc 32
>         1792       28 drivers/usb/host/xhci-mem.c:38 [xhci_hcd] func:xhci_segment_alloc 59
> 
> But with rc3, the memory usage increase after each suspend/resume cycle: 
> 
> #1:
>        49152        6 drivers/usb/host/xhci-mem.c:980 [xhci_hcd] func:xhci_alloc_virt_device 9
>         1024        1 drivers/usb/host/xhci-mem.c:841 [xhci_hcd] func:xhci_alloc_tt_info 2
>          384       12 drivers/usb/host/xhci-mem.c:461 [xhci_hcd] func:xhci_alloc_container_ctx 32
>         2176       17 drivers/usb/host/xhci-mem.c:377 [xhci_hcd] func:xhci_ring_alloc 32
>          128       14 drivers/usb/host/xhci-mem.c:49 [xhci_hcd] func:xhci_segment_alloc 34
>         2048       32 drivers/usb/host/xhci-mem.c:38 [xhci_hcd] func:xhci_segment_alloc 61
> #2:
>        57344        7 drivers/usb/host/xhci-mem.c:980 [xhci_hcd] func:xhci_alloc_virt_device 13
>         1024        1 drivers/usb/host/xhci-mem.c:841 [xhci_hcd] func:xhci_alloc_tt_info 3
>          448       14 drivers/usb/host/xhci-mem.c:461 [xhci_hcd] func:xhci_alloc_container_ctx 46
>         2432       19 drivers/usb/host/xhci-mem.c:377 [xhci_hcd] func:xhci_ring_alloc 43
>          144       16 drivers/usb/host/xhci-mem.c:49 [xhci_hcd] func:xhci_segment_alloc 44
>         2304       36 drivers/usb/host/xhci-mem.c:38 [xhci_hcd] func:xhci_segment_alloc 82
> #3:
>        65536        8 drivers/usb/host/xhci-mem.c:980 [xhci_hcd] func:xhci_alloc_virt_device 17
>         1024        1 drivers/usb/host/xhci-mem.c:841 [xhci_hcd] func:xhci_alloc_tt_info 4
>          512       16 drivers/usb/host/xhci-mem.c:461 [xhci_hcd] func:xhci_alloc_container_ctx 60
>         2688       21 drivers/usb/host/xhci-mem.c:377 [xhci_hcd] func:xhci_ring_alloc 54
>          160       18 drivers/usb/host/xhci-mem.c:49 [xhci_hcd] func:xhci_segment_alloc 54
>         2560       40 drivers/usb/host/xhci-mem.c:38 [xhci_hcd] func:xhci_segment_alloc 103
> 
> The memory increasing pattern keeps going on for each suspend/resume afterwards, I am not
> sure whether those memory would be released sometime later.
> 
> And in kernel log, two lines of error always showed up after suspend/resume:
> 
> 	[  295.613598] xhci_hcd 0000:03:00.0: dma_pool_destroy xHCI ring segments busy
> 	[  295.613605] xhci_hcd 0000:03:00.0: dma_pool_destroy xHCI input/output contexts busy

Hi,

Good work, looks like suspend/resume is a little understested corner
of this driver.

Did you check whether the same leak occurs if you simply disconnect
a device or if it's truly unique to suspend?

> And bisect narrow down to commit 2eb03376151bb8585caa23ed2673583107bb5193(
> "usb: xhci: Fix slot_id resource race conflict"):

I see a trivial bug which everyone (myself included tbh) missed before.
Does this help?

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index f11e13f9cdb4..f294032c2ad7 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -932,7 +932,7 @@ void xhci_free_virt_device(struct xhci_hcd *xhci, struct xhci_virt_device *dev,
  */
 static void xhci_free_virt_devices_depth_first(struct xhci_hcd *xhci, int slot_id)
 {
-	struct xhci_virt_device *vdev;
+	struct xhci_virt_device *vdev, *tmp_vdev;
 	struct list_head *tt_list_head;
 	struct xhci_tt_bw_info *tt_info, *next;
 	int i;
@@ -952,8 +952,8 @@ static void xhci_free_virt_devices_depth_first(struct xhci_hcd *xhci, int slot_i
 		if (tt_info->slot_id == slot_id) {
 			/* are any devices using this tt_info? */
 			for (i = 1; i < HCS_MAX_SLOTS(xhci->hcs_params1); i++) {
-				vdev = xhci->devs[i];
-				if (vdev && (vdev->tt_info == tt_info))
+				tmp_vdev = xhci->devs[i];
+				if (tmp_vdev && (tmp_vdev->tt_info == tt_info))
 					xhci_free_virt_devices_depth_first(
 						xhci, i);
 			}


