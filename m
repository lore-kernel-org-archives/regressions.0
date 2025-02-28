Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2068266F08
	for <regressions@lists.linux.dev>; Fri, 28 Feb 2025 11:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740743954; cv=none; b=VNNm/fAgf3cmSLEowNnDc2t+roLYWd4XAdTzv/LJDuJyxrD7LFu5xdKyLvkb3uPinHUGnyhbfDRbrhZ5JXDDhFVkz2BxQQ2bP7uP7gr2oxewhUsNj5FuFyyJggoRWgn+yWr6BiytLXoNcm/ApGfF5sw0IMkP9zsDVvAVQD/e/PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740743954; c=relaxed/simple;
	bh=VQbQx9Tb/ylyfB9fXhvn72VbZpr6LY7NbCp0MA1QlIk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qoyxoJ98vKGaDkCpljKttVd2O1MpNt0SGE632Fh8e1MWqJfQm2kWzOffEhEpGlybTxrjUxyz5yh29TG8G9DS3Og+iBbFObqJSTvOOD5jtozPjlq90IHw2tQB4evsB+7gmps8Zw1GgQZPCjGsqdiVpD93K91R9k9qcWfwUtpDdOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dhMtP0RE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dhMtP0RE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740743949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wWpOhsnDYuLDB7qcQwdEr5LnVDJuu5aDQkc1qn24s7M=;
	b=dhMtP0REfJCb+4fLU3alJRZO6ZHJEDQpNP8tikZbVAQZ+3uwuHVkZSfW/1DCY6WK0em/t9
	ZhraQ0yKw1lt2Y9TCoYyjIZsbcdPxGq5cnu/DRxVJCjepMrRQyS5PaZDTIPj6L5HNiwg1t
	nrF9azp2dZloDrRjD1Fl1fMV32CF2Mc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-YzrbccHoNOaUPtu6wig0Dw-1; Fri, 28 Feb 2025 06:59:08 -0500
X-MC-Unique: YzrbccHoNOaUPtu6wig0Dw-1
X-Mimecast-MFC-AGG-ID: YzrbccHoNOaUPtu6wig0Dw_1740743947
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4393e89e910so11760135e9.0
        for <regressions@lists.linux.dev>; Fri, 28 Feb 2025 03:59:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740743947; x=1741348747;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWpOhsnDYuLDB7qcQwdEr5LnVDJuu5aDQkc1qn24s7M=;
        b=QvcePnTT8qjuw7fS2YSeF0d2j7CoSSswOTt/LOLM0L2MAGu8gZA2eplqZyCU6PN3tC
         GuaM806UsRsbSwEJotI1dVTt+g0Y/f02j28gDMLRj6H38DO9dw5wj2ote693qq2pEl1Z
         LasppiJJo9vV1mw63rNiAL5tLt/9t1Al7nw//Adf9MAnhZ1OMNcdJyctP0tSAoHgumzX
         0ss1YaQHqgFF/BAAnrSmKDBztJ9QzAqYtzLpjKLynTQxXjB68kdTeEx6pwyzATL/xMF6
         n/OF9dEXnPKUP6xebFdiEJIRQWL0Pq12+vOTXYZ/4EAC85EWNDh6x0dj0FQ0h55W422J
         yoyA==
X-Forwarded-Encrypted: i=1; AJvYcCWOCK08XWpwhgIZ5os9OotnnxvMpqh3/vZ/j1Zwk7TG5qbgeYDnZ3cZVAnKDdKHGcyRmZGwxUifEGOhKw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCnrSArcKbNSfMIFWFPeyu1fmYDbDXj3FzbvHRCi7aDbbO4y8L
	6t3+gw06U807UsRuyzDVmt/TaP9l92WC94jNNAKqSduzV7UKzJ6wyz0+ZfAzykO/4+3XOHJTT+s
	8CrGEwt1+v1Pf7bU7pj5P0xxAxMqUYQSKIJH6KmedDZWFaDLftoY938iuJt4=
X-Gm-Gg: ASbGnct8MThBp6tLyCbu0gfKZdfmC+sbe5JYBktytvMDR1iYE8hrZxPwzwXvaYRhwKg
	KURJ2Fye57XpgcGGk+ssvczEIrVSpxoKcNahfyBiVLcXniyB1jvlu99IBKaMlBGrUr6TR4Q3c9h
	GzIqN7CGdgMRygbqsa3q4ohWV6Ro+kTHWNuN/Nwn9Gy6FOHaBvZ0It1YWEQxFe39498uuSBNmFa
	MGhLol/rvPvdeY315mX2+MzF8mTM6xzaxUSgXLHt64tLxL/DIbugF1f7M/XsIWcqAb2ErEr966P
	JytcymwY07NlXhZh3evr0oM+Pnp0SfQQCh8IKsk=
X-Received: by 2002:a05:600c:a48:b0:439:99ab:6178 with SMTP id 5b1f17b1804b1-43ba66da248mr24474515e9.6.1740743946918;
        Fri, 28 Feb 2025 03:59:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHB0UrvqyMu/fSpDRZaZiAa/32E38lbMFhM89jeBgbV4iK2c0lfb+kgt5fZFUgEb5hDKw36fA==
X-Received: by 2002:a05:600c:a48:b0:439:99ab:6178 with SMTP id 5b1f17b1804b1-43ba66da248mr24474255e9.6.1740743946574;
        Fri, 28 Feb 2025 03:59:06 -0800 (PST)
Received: from [10.43.17.94] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba532b8dsm84815995e9.14.2025.02.28.03.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 03:59:05 -0800 (PST)
Message-ID: <71bbd596-a3a0-4e37-baae-19f02c6997be@redhat.com>
Date: Fri, 28 Feb 2025 12:59:05 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ondrej Kozina <okozina@redhat.com>
Subject: Re: [PATCH] block: cleanup and fix batch completion adding conditions
To: linux-block@vger.kernel.org
Cc: axboe@kernel.dk, gmazyland@gmail.com, regressions@lists.linux.dev
References: <20575f0a-656e-4bb3-9d82-dec6c7e3a35c@kernel.dk>
Autocrypt: addr=okozina@redhat.com; keydata=
 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
In-Reply-To: <20575f0a-656e-4bb3-9d82-dec6c7e3a35c@kernel.dk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aZuINF-200R77FU9d95n1UqyeMlMGXzw4V8TW-6fu2A_1740743947
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jens,

this patch introduced regression to locked SED OPAL2 devices. The locked 
region no longer returns -EIO upon IO. On read the caller receives block 
of zeroes, on write it does not report any error either. In both cases, 
previous to this patch, the caller would get IO error (expected) with 
locked device.

It was discovered by cryptsetup testsuite specifically 
https://gitlab.com/cryptsetup/cryptsetup/-/blob/main/tests/compat-test-opal

I've attached a simple patch that changes the ioerror condition and it 
fixed the problem with SED OPAL2 devices for me.

#regzbot introduced: 1f47ed294a2bd577d5ae43e6e28e1c9a3be4a833

With kind regards
O.

------

diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index fa2a76cc2f73..b891ed113306 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -874,7 +874,7 @@ static inline bool blk_mq_add_to_batch(struct 
request *req,
   	if (!blk_rq_is_passthrough(req)) {
   		if (req->end_io)
   			return false;
-		if (ioerror < 0)
+		if (ioerror)
   			return false;
   	}


