Received: from mail-pf1-f226.google.com (mail-pf1-f226.google.com [209.85.210.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF7247F63
	for <regressions@lists.linux.dev>; Mon, 11 Mar 2024 17:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710176595; cv=none; b=ibBBLLUWYDvnwOXYY29v5OJQG+AnCb/FSBjBDznzGhEWy5i4sxx3DwJxFxQQUC+l71kTYdXKtoMQJG4Tykbnlsa3FB/TBPMu8OKvKRa7huSEfgjfOTwNeLSU8jU3SJorF7CjXnCDqCWrZKbMOD2BtUQZ++SgTglvN0QNJgdQFUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710176595; c=relaxed/simple;
	bh=agaJq87etNffqdB6IMs5QiSDbY44VKyrosXTgjFI/t4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=M0MjzqMyamQAyGYgfyYBt9P5pfDg73J/aO5Xofpqo9UbJzAKvY2rlohfQOEGwriEu2O6UQu8vwGSlE9x/7oXp8HZ0aEPl/i0hoV8gJT/kzHDDQKpMBS925G2Aaw8yzixzyin7hoQ728Eq2+Akz7zOtJMr4F519hl9iGuQ8hrJxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.totalphase.com; spf=pass smtp.mailfrom=totalphase.com; dkim=pass (2048-bit key) header.d=totalphase-com.20230601.gappssmtp.com header.i=@totalphase-com.20230601.gappssmtp.com header.b=qMj347CI; arc=none smtp.client-ip=209.85.210.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.totalphase.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=totalphase.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=totalphase-com.20230601.gappssmtp.com header.i=@totalphase-com.20230601.gappssmtp.com header.b="qMj347CI"
Received: by mail-pf1-f226.google.com with SMTP id d2e1a72fcca58-6e6277f72d8so3057243b3a.1
        for <regressions@lists.linux.dev>; Mon, 11 Mar 2024 10:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=totalphase-com.20230601.gappssmtp.com; s=20230601; t=1710176592; x=1710781392; darn=lists.linux.dev;
        h=thread-index:thread-topic:content-transfer-encoding:mime-version
         :subject:references:in-reply-to:message-id:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=shpVNyKeSTmB1beltwD0e8eAjAeqYSJLBZ+0bq/aWSk=;
        b=qMj347CIkwiH5lWfMFafQETlGAB3X68mKpMvA5fX03S1fYJJeA0j47G50dwGTitR1G
         Fd6yCEJe2GOAEmRD2/uC1f/zCynjoZoXwZbdsdq/ZC3WLmcMcjgaYIrPiA6Fnx7RFq8p
         1FUlDnfDkhcwa+37F3oc0eIVaXHcZKOrVlWgxHjJsk1YWxN+vEoF2ga3U+ODT5JPmBfU
         56OIkLzyQgYT4A5kd9faJJDuSrD+s8Jhfzh/ZBTDi+/9PuWTtMfzcGaHtHa2ewlD6Ytn
         KQUseBHdGoh4bPKiZril45J9Qs+7PXec5tdkgL4S3NsfvvRW07jtYTbhfeedEVnPrfAP
         w47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710176592; x=1710781392;
        h=thread-index:thread-topic:content-transfer-encoding:mime-version
         :subject:references:in-reply-to:message-id:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=shpVNyKeSTmB1beltwD0e8eAjAeqYSJLBZ+0bq/aWSk=;
        b=BioRaLrHqRjZ3VMLeJrKNNKAgngg/BlD48iD+a9LqXZ8XIUQAMz/v8uCTNF23AznDD
         QQF9qbdZe2EXRKp/7aZkGiJaaLSrSh1lxG7QjgYrFtjRfQKXKZOSL8XtJz16XubReHXg
         4r6TjyTRt8AYxSFoxH9vxYTwp+uB6P6uS/RYyFu7rT64Hz0XhA0TzABQSHE7tFE5gtjk
         O1gDMJinXYgFFVidxCMxQMFMf//BjAbeZIgMijV+kvdGGzAiB9so80ndM0ycpZSKxGxN
         Z9RsDezfS4IeU2LLk/1DK17G9NTtQM9SVYFp7RXPkAvRJOKaedHkGjzkmdMN4H0oJ1s7
         fq2g==
X-Forwarded-Encrypted: i=1; AJvYcCXFUvAznIaa0bqMQf20tn4nzf21HvHjL5EfdNtPXmNE27cNrQnYsHxCyVU5DyMv9rOpAWaQ0J6HmWNp62k0jRa5bie0fLP74Mzp6G8=
X-Gm-Message-State: AOJu0Yy81GbUinRBNX51kKGmYERXHpUGUzxp/xKnm0xHWP0Shv0vlQWR
	p1K4gGV7o05S7YcYTjtBOtOJkBMsy+/bTkIOgIRXBMw5D4il6DswbhTTWzqLVsGWODpX6DohNSV
	46C7Yy6Ug7O6S54DtODICVSdteeF+obuc
X-Google-Smtp-Source: AGHT+IE9dy7qP1AWuyzDV9+vOmVP7Cxxr7MyciseHsVaUm/V7/oyEVUvRITXAfD74JVyYFkequ25w9vWrbam
X-Received: by 2002:a05:6a00:22d1:b0:6e6:9812:9c03 with SMTP id f17-20020a056a0022d100b006e698129c03mr2384694pfj.31.1710176590780;
        Mon, 11 Mar 2024 10:03:10 -0700 (PDT)
Received: from postfix.totalphase.com ([65.19.189.126])
        by smtp-relay.gmail.com with ESMTPS id f14-20020a056a00228e00b006e698eaa3fcsm122133pfe.3.2024.03.11.10.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 10:03:10 -0700 (PDT)
X-Relaying-Domain: totalphase.com
Date: Mon, 11 Mar 2024 10:03:07 -0700 (PDT)
From: Chris Yokum <linux-usb@mail.totalphase.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	stable <stable@vger.kernel.org>, 
	linux-usb <linux-usb@vger.kernel.org>, 
	Niklas Neronin <niklas.neronin@linux.intel.com>
Message-ID: <1525093096.37868.1710176587331.JavaMail.zimbra@totalphase.com>
In-Reply-To: <717413307.861315.1709596258844.JavaMail.zimbra@totalphase.com>
References: <949223224.833962.1709339266739.JavaMail.zimbra@totalphase.com> <50f3ca53-40e3-41f2-8f7a-7ad07c681eea@leemhuis.info> <2024030246-wife-detoxify-08c0@gregkh> <278587422.841245.1709394906640.JavaMail.zimbra@totalphase.com> <a6a04009-c3fe-e50d-d792-d075a14ff825@linux.intel.com> <3a560c60-ffa2-a511-98d3-d29ef807b213@linux.intel.com> <717413307.861315.1709596258844.JavaMail.zimbra@totalphase.com>
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
Thread-Index: VuTzduXODhc7IqP5hozJk2GPpe5bnIAKY5/B

Hello Mathias,

Thanks for the help with this! We saw that it's made it into 6.8. Is it possible to get this into 6.6 and 6.7?

Best regards,
Chris

----- Original Message -----
From: "Chris Yokum" <linux-usb@mail.totalphase.com>
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: "Chris Yokum" <linux-usb@mail.totalphase.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Linux regressions mailing list" <regressions@lists.linux.dev>, "stable" <stable@vger.kernel.org>, "linux-usb" <linux-usb@vger.kernel.org>, "Niklas Neronin" <niklas.neronin@linux.intel.com>
Sent: Monday, March 4, 2024 3:50:58 PM
Subject: Re: 6.5.0 broke XHCI URB submissions for count >512

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
