Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716285;
	b=Fxoae9Pqpt5ibTGOGBEodmUdMfSLATg5neXEuXlGbf6dhCSkohiCObQ56l9c5IMZXjlb
	 RE6NmcGdpogPL8CWkRO1kTB2mKjFGVpDQrI8jueU535vMiGAZnJo5diMVfC+emnAP4NN9
	 ahyCc2N3HiV18rVAVTLFIPyrLMVR7WaWp0ddAB7/BuhGSko9JjK7tAMjMwcIE7IHbnY8q
	 fl6A+8g4DdoqsgnE2Ausrarkj6FID6zTRzV1AZaejWsD68rKBtc7gu4yzTUQ+fjb3rJX6
	 dur4EBzciTAqN2m9c7nFqdqJM1q7FVcQ/YeZR3Yr6ZILsmiK47RDZHK97hLHqOxO4ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=8V8dKjtxkMWSm2f6XmuG8tj/FFGpuDNeGHGqW2z0R08=;
	b=wPQt/i19a3lphA2a+b0KyuSEDGoeZ70UgBygsH7uqKDTtxYLfQ9V9sJV7+hcssT/xBVX
	 uigXKJzRETJZbJK8ofehiTBWlcdZjPZe1eFb2mL2r1Y85Exh+eMEOjwiKfzJPIcS4ridc
	 TthqMm3sBuVua6TpYg0YPGIP3WIR1lfXNUQ07q9WpC7mZuQAprYe1ZA1Wq4G3dTK6CS9k
	 XI37o8T2sVRRCUp+BmRC2dYBMWrYVvP0Pm6P3UhMw7aO5VHlNwhPtrSkj/2EyLNAvBl2w
	 UveRkmxTEVP+y/FVfsUn+39CjC7eITSxjyZHL+JzRpaNLuwh+Pcm8SGnIeOxSYPgNpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="aErjWo6/";
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B02C606A333
	for <regressions@lists.linux.dev>; Tue,  3 Nov 2026 14:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B02C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aErjWo6/
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-14394530ec6so5585589c88.1
        for <regressions@lists.linux.dev>; Tue, 03 Nov 2026 06:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716285; x=1794321085; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8V8dKjtxkMWSm2f6XmuG8tj/FFGpuDNeGHGqW2z0R08=;
        b=aErjWo6/1xrL5ELlPhNMoZekz+/9uXgW7BO8XLIPHcT6GEbCmEonglv8sOavvxP3iV
         jY/NZ/YJLFMoygaR7LofYrlf0ildaxqH7Dvp/N3TETXNedFBbTeX6W3pQv25ugiwTmWO
         VnPM5s+n7f1wjJJrQmbMyXta1XDnH6IyNt6Qw3E3XU8vXmd2dWubTtvucminnkIYQHfC
         MPFqVDOdATBsL9etI22n+71hGAUZd5W0pAZ4lixDdsBFtql+h9XVL7L8brkGUaF1iaBQ
         2f/FYnaeu1gyl9zASfTMmeOh0ORiMQ1B6mLv6H3OncA/7MQIldLrsjNDCtDABNSJdL0l
         KQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716285; x=1794321085;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8V8dKjtxkMWSm2f6XmuG8tj/FFGpuDNeGHGqW2z0R08=;
        b=Vzfp73GDCIwSOO1R5OYSMaF5BGpvSed/5bZkHlgdI6wbb9vhghMYumrpNQDrbcl/rQ
         MflXriRg8zlEB0HHB30U8BHMvG/FNUHqk8Y3HwfEpSCji6KW5T8jlfsVSBNQog0ggoqB
         xOEO7yIjwkinDpt+aA5QOBZDcv46x6KTFsEmvZyXG/BHRc6lRIY6i/nfnL+AH0E0Z6C/
         uSsRpfdgYq9Yy751D/V59KrjuucYZ4Gknmlqjyjydo9N/A2cKzpyycXI61TbJptTH3OI
         1R5pys1lcOgyOXJ4YXtNCbJnjohfbT79XbJDjCpVm0hfyG2FaGZjObvPHqHVxEiipHKt
         TYqA==
X-Forwarded-Encrypted: i=1; AKwUvBy6zxPJAYrkDVAgZzNT5rFmvDtzGN/lQqzRljjVmB7P7V/polNiOiLx535ciI0kB4JzSzqNbTjnP4Xc2w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/kLdP33B0zK6KRkhv77UKZHJiOEy908gYMBF5UyefDK2Mismof
	lJrklv6adJAZczv5q9n5SspcZLl73/srz9Oes3wHNivww7OFhLZ7Xi/l30V/5rJ05meV4OSqZBt
	jW39wqiA=
X-Gm-Gg: AYBFou0KUfpcTnzdt65lk0hP3JgvZR/Ek2tDWRC9xAk1oS7/5ylM03XeoapSlg9pLQo
	xTa9H8mmngP1aOaL58wVINpxedTUIseawQx/PDpYbUrHkWnY5vOz9YGBePVXo/ODoTNhuc6E54d
	H5ap80fGERMbWioQGOr+lEv7Ud3JCB8NfqRLYWPRBukG678C+urfPunacjV9Qdc/rlob5bvMv/d
	jEtNVyEnCHzXwwKwPKXU4cy8+Ck8wFRHcGotXH2fhAiaisjA5T1n/kru0/A9g6Za1A0QoquOegc
	QjGfOvKhO3IA7MmcfjfaHDRUGYWJIq1OF3X+gFWtHZ2iyQa8pcfXfms0hbYi0WZjCIdTDHoJ6Mi
	Zn0p1sX42G2NO4F/FygvvtkS7VMG00m2YXZW6rnwbd41l771p3mHo0UjLK9zhNRuOUWvs8Td8LQ
	M66uxXFFeqS8lUqI8su8HjWxRuuKLtxnyPFEUseYLrhe9/sOWZR341V4ukuYiXBJXVJ5LWuSOHG
	0VqLkAINEgRglUZhMqwNTfwROkOJYb4eA3IBcm5DMissH2POQW5qi2ksoMKdt2ICgEo+cqIxyqv
	lPqwPqfKW4nriAJElcI6Mw3vr+KJ/Ceea+KqiBrzhTDoDzXfVXS7qnxC5FCQ1pjFPg3V+rKKtnx
	G/7SZyP9HnA3zfLtAECjaJIAEpRfPYqV6hQ==
X-Received: by 2002:a05:7022:88:b0:144:fb31:a597 with SMTP id a92af1059eb24-1ac6069cebdmr18479029c88.47.1793716277896;
        Tue, 03 Nov 2026 06:31:17 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:16 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Laveesh Bansal <laveeshb@laveeshbansal.com>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, 
 Nilay Shroff <nilay@linux.ibm.com>, Ming Lei <tom.leiming@gmail.com>, 
 Christoph Hellwig <hch@lst.de>, Yu Kuai <yukuai@fygo.io>, 
 Reindl Harald <h.reindl@thelounge.net>, regressions@lists.linux.dev, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261031044141.5569-1-laveeshb@laveeshbansal.com>
References: <20261031044141.5569-1-laveeshb@laveeshbansal.com>
Subject: Re: [PATCH v2] block: only serialize elevator switches of the same
 queue
Message-Id: <179371627639.3691261.7215818828022045102.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:16 -0700
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 30 Oct 2026 21:41:41 -0700, Laveesh Bansal wrote:
> Since commit 4ff58d6bc9dd ("block: serialize elevator changes for the
> same queue using a writer lock"), a write to queue/scheduler fails with
> -EBUSY whenever something else holds set->update_nr_hwq_lock. That
> commit takes the lock for write, and it has to be a trylock because of
> commit ce8ee8583ed8 ("block: use trylock to avoid lockdep circular
> dependency in sysfs").
> 
> [...]

Applied, thanks!

[1/1] block: only serialize elevator switches of the same queue
      commit: 603523fd54664f17630f742229166278568c3ce8

Best regards,
-- 
Jens Axboe



