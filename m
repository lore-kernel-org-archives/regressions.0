Received: from mail-qv1-f97.google.com (mail-qv1-f97.google.com [209.85.219.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4EF7D3E7
	for <regressions@lists.linux.dev>; Mon,  4 Mar 2024 23:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709596267; cv=none; b=f/BIeL6gb76Z4cgoGZF4R9Ws+3N/QWLiiKqPW5LkfbkeT73PWujBgQ2mM2KSqP0nrK6J/Da7OCSsC/qGDk2wfknhagXu5VZYOKfXDVHujW4W6RGiCaI8epQq5JVLZm34ZFxqeHmuvtlIdebFjrnp2n0kMsfTm8SXnUzjdi4I0e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709596267; c=relaxed/simple;
	bh=lZBdGXN3sDOALNhqG18J8ZzeUVL9c1fKKZLxSYGTO8Q=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=QF5aUC3KFi6sF4MHKNxVouwK1AFjpGMtxM44mB5ZlCHpFT6E1Bz4RKxKbtHSy8NYjVyZEo8Zf+ka95nsA7KudhE0S+S0x4ARqs7R581uCvJ913/6nu26pr5i6nzY5WmAxFp6n9nD504lEe8vBkCnFgNnzje38H47VD3AxjidGJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.totalphase.com; spf=pass smtp.mailfrom=totalphase.com; dkim=pass (2048-bit key) header.d=totalphase-com.20230601.gappssmtp.com header.i=@totalphase-com.20230601.gappssmtp.com header.b=vNImkBjh; arc=none smtp.client-ip=209.85.219.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.totalphase.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=totalphase.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=totalphase-com.20230601.gappssmtp.com header.i=@totalphase-com.20230601.gappssmtp.com header.b="vNImkBjh"
Received: by mail-qv1-f97.google.com with SMTP id 6a1803df08f44-68f9e399c91so43915186d6.2
        for <regressions@lists.linux.dev>; Mon, 04 Mar 2024 15:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=totalphase-com.20230601.gappssmtp.com; s=20230601; t=1709596262; x=1710201062; darn=lists.linux.dev;
        h=thread-index:thread-topic:content-transfer-encoding:mime-version
         :subject:references:in-reply-to:message-id:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wHZdIg82gQhhliIHQKfVKh00PcHpYfuwKdT2lavfKEM=;
        b=vNImkBjhx5HTGyRmpaQphahKdy9bdAMF3fOEAEFLM2w9/5xE6fOpYcK7gSckmUTNo1
         OqaqijCHsdaaErSYsPsSHF32fQY1zQm6igoxitoL3BfeUUitBPUrPwsaxaQcQDajXp5D
         HltBJOav+xie4eTaQHh2mdYggp8BwMtB//7mJ6PKd1BQq85HrB9yApZYUEBvzGkaL4ua
         cwwlYa5rLDmpoquce6v2KsRnhtOpC/NmLycSkfH6XslmG2CkIwAcyONXwMPf1yVqgIt0
         tG4KcoEYxiTuT2Fer0xHAJ/K0c6rnMuSmOQyOSDZMcL3B5T60WVIU+a6djB0A/R6nEis
         tlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709596262; x=1710201062;
        h=thread-index:thread-topic:content-transfer-encoding:mime-version
         :subject:references:in-reply-to:message-id:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wHZdIg82gQhhliIHQKfVKh00PcHpYfuwKdT2lavfKEM=;
        b=j9OeiVivL9jIEy4INee1ivztXyYdNrEbtAncBOgDsvsaouti8+PgE7wsyGjdef/BY0
         N4b4aQog46Hq06CNvlJeObaAdrlp/XCNYs87+FRWLUEIXSbd1lGMhszNmBif8B1BO+8K
         /UbVFk+OdIxuGwhQHcp4NC6y1y6DWD85ujukhwMPzbhelRvloThpzRAkkLtDRHtPa8u9
         fLE4B3oaT6opEB2hE27pr/o6PYfS67+10CxfpLlZ4e85csgQdp8wifa+6lx6PE3+E3cQ
         /z0L8d+eOywX32JlQQHZF6N2DUwh0yPuLeB6jjhRTc5UHm8+Vdcq4BVgyVhKrW6vz49G
         zpuw==
X-Forwarded-Encrypted: i=1; AJvYcCUv8VJEkHwsyc+yDbCJiYy2LMbl92DmxAJoF/36nbUcZeSIU+WDHU+Pu1mERdhANdkvNHOTamm4M8eUVCMmLRpJ5UePqZpySvr1fR8=
X-Gm-Message-State: AOJu0YzhO6Mk3lA3AHlSOU+lghgbjHIaEmLbn+Yc9YrMFA3PTW4ufml2
	oFkYrKGiFfHAOLl+FAhipDt9nbp4kc750YqoBIG7Fln+jPiannoKLi5jz/xR6ReiceTBIScfD33
	+gHxfeLMg0EIIpHscpjMGkCOCFeLx7Zkz
X-Google-Smtp-Source: AGHT+IGjrnpWm32tjepbwSg4ok414e9vCSPGJ/gCDRSDlPlb+tNcp7BCav1jwGVFW7lOL9uJ2BNP02koL33o
X-Received: by 2002:a0c:e114:0:b0:690:5f74:81a7 with SMTP id w20-20020a0ce114000000b006905f7481a7mr390876qvk.45.1709596261870;
        Mon, 04 Mar 2024 15:51:01 -0800 (PST)
Received: from postfix.totalphase.com ([65.19.189.126])
        by smtp-relay.gmail.com with ESMTPS id ke25-20020a056214301900b0068f732494easm562457qvb.42.2024.03.04.15.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 15:51:01 -0800 (PST)
X-Relaying-Domain: totalphase.com
Date: Mon, 4 Mar 2024 15:50:58 -0800 (PST)
From: Chris Yokum <linux-usb@mail.totalphase.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Chris Yokum <linux-usb@mail.totalphase.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	stable <stable@vger.kernel.org>, 
	linux-usb <linux-usb@vger.kernel.org>, 
	Niklas Neronin <niklas.neronin@linux.intel.com>
Message-ID: <717413307.861315.1709596258844.JavaMail.zimbra@totalphase.com>
In-Reply-To: <3a560c60-ffa2-a511-98d3-d29ef807b213@linux.intel.com>
References: <949223224.833962.1709339266739.JavaMail.zimbra@totalphase.com> <50f3ca53-40e3-41f2-8f7a-7ad07c681eea@leemhuis.info> <2024030246-wife-detoxify-08c0@gregkh> <278587422.841245.1709394906640.JavaMail.zimbra@totalphase.com> <a6a04009-c3fe-e50d-d792-d075a14ff825@linux.intel.com> <3a560c60-ffa2-a511-98d3-d29ef807b213@linux.intel.com>
Subject: Re: 6.5.0 broke XHCI URB submissions for count >512
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Thread-Topic: 6.5.0 broke XHCI URB submissions for count >512
Thread-Index: VuTzduXODhc7IqP5hozJk2GPpe5bnA==

Hello Mathias,

Yes! This fixed the problem. I've checked with our repro case as well as our functional tests.

I'll email you the repro code directly, you can compare the unpatched and patched kernel behavior.

Best regards,
Chris


----- Original Message -----
From: "Mathias Nyman" <mathias.nyman@linux.intel.com>
To: "Chris Yokum" <linux-usb@mail.totalphase.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Linux regressions mailing list" <regressions@lists.linux.dev>, "stable" <stable@vger.kernel.org>, "linux-usb" <linux-usb@vger.kernel.org>, "Niklas Neronin" <niklas.neronin@linux.intel.com>
Sent: Monday, March 4, 2024 7:53:03 AM
Subject: Re: 6.5.0 broke XHCI URB submissions for count >512

On 4.3.2024 13.57, Mathias Nyman wrote:
> On 2.3.2024 17.55, Chris Yokum wrote:
>>>> We have found a regression bug, where more than 512 URBs cannot be
>>>> reliably submitted to XHCI. URBs beyond that return 0x00 instead of
>>>> valid data in the buffer.
>>>
>>> FWIW, that's f5af638f0609af ("xhci: Fix transfer ring expansion size
>>> calculation") [v6.5-rc1] from Mathias.
>>>
> 
> Ok, I see, this could be the empty ring exception check in xhci-ring.c:
> 
> It could falsely assume ring is empty when it in fact is filled up in one
> go by queuing several small urbs.

Does this help?

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 6a29ebd6682d..52278afea94b 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -332,7 +332,13 @@ static unsigned int xhci_ring_expansion_needed(struct xhci_hcd *xhci, struct xhc
         /* how many trbs will be queued past the enqueue segment? */
         trbs_past_seg = enq_used + num_trbs - (TRBS_PER_SEGMENT - 1);
  
-       if (trbs_past_seg <= 0)
+       /*
+        * Consider expanding the ring already if num_trbs fills the current
+        * segment (i.e. trbs_past_seg == 0), not only when num_trbs goes into
+        * the next segment. Avoids confusing full ring with special empty ring
+        * case below
+        */
+       if (trbs_past_seg < 0)
                 return 0;

Thanks
Mathias
