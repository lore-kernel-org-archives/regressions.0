Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8F23CB544
	for <regressions@lists.linux.dev>; Thu, 10 Sep 2026 20:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073735; cv=none; b=upW5UZFmWYjlvYgAd4sMewFIl78Wln4Y9crMKjXBC8iktCmeD8W80u6nLN7QTcMoBdyoxEpzqIPpdf+JS2M7J9jVvUt6GaQ5IILIkY87GKohXnocP6W/lIQ8Y0KPlrSS7gB3oyj41MK8RScWRAf4J5IzAzxQGyEACLuMF+w1Fp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073735; c=relaxed/simple;
	bh=t6ppwnoW/+SGU7+SZTpQCy0ZyrHu7AGE6vmt1IJD2Xk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kE8O9idciA03PhQgbKzp3dF2Hyz7AsvTpfRoR1VLQyDS4nkXES/vNseBGiMzpWHYkCkCJjHtieKKBFowOrBsB1mPn6Yxo+UelPZ3Tf7RZjThQi5oDQBODPDWPXmWSBrII/YOcSShyMbcoFRood8pT+hHJ7YBKkLTnLNVKhn6WIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=ll2vI/LH; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="ll2vI/LH"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7f4f0cfb29cso140893a34.1
        for <regressions@lists.linux.dev>; Thu, 10 Sep 2026 13:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789073730; x=1789678530; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B/R1OOuoA7A615cqKW89RYxj2atLZSBY/Ou5CD1Turw=;
        b=ll2vI/LHj+ABh+4OcghMojiI/zJ+nUjQZq1jbZS9tsqtbExA4g1F90hYlDOnURRo+h
         hf1tRwqBgAslxSNUzGWuQsUUlrk1ksJYCOFpUcEbLw+xwd+V49gTGM99kD8K8aKsJfTi
         AUdhHH3Rl4Ts3xZxjxq633b2tkpoiGX0iOX5MomUqylasNKME1GMhEnu6Ce7kdfo3oMI
         GKo4Arpo/gmoYQ6FxttjdZ1zf01nwXQHm+QGczwNHDDs2Fs+6f859jQ8Nx+k02PoRsCv
         hR1NdF/qBVRv2OQ39AfmAVKw3VsABAFLNkCbO4o+7BqBDiBo8FzxOaA4IKvq4umiMN0z
         p2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789073730; x=1789678530;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/R1OOuoA7A615cqKW89RYxj2atLZSBY/Ou5CD1Turw=;
        b=YRYCjUvNNj2Hf+t40+Snlz6NZgajLt89hKzaZ+jiK5XfQ5mW2W03+UNQut5GiG0Oi/
         VOhSrZGT558MrrT7+UrJVa0w0Lc4sRN/KTpeZOJq5vgG1DrHsr57gRVtv7Eiq2ZsNb+l
         DoMNpRM0NKIj9qT6s2MgF8gao90MR70oRqh3XuFO/LSaRh4JCg51IDN5lI16YORh//4T
         /X5dvFOg7YxF1HRn1p3ntMtXeGs516ITIEBxoloWAH2V6b4fxDLkZZbkRj2WGOi95SMk
         xXMTi0OpSq1spsfIE65LRQ+wKlWZ5DAKBWrvH98ih7HwZsBidiOTOKgcQP/2xKsGbeGR
         OSGA==
X-Forwarded-Encrypted: i=1; AKwUvBwUK36LH6LNZkzKDE5wxJXxbS0MnEk0SkTJuSpCGm9kfBpugSVHg3d0rrMOOAwtZza/q0xTHHwydJABnA==@lists.linux.dev
X-Gm-Message-State: AFuF++lUxGnm95AFqJ2RJtwR9WY2e6c4JyeASJTuCM65y5zkzAqeRtWZ
	Af3/4Mkhtazh0KSH510zTjvgk0wB4I609NYO/t5MduX0XM/JJ95YQ9A3WxEVULQm4re1h60hvW/
	8l7/W32E=
X-Gm-Gg: AYBFou3d6cklOc47EbYLcKXB97pZHexT+ibOM+1hsyiFer9Rl52Oj89Ne/SQJWbEZzQ
	TKABQznU13DM4bGakqWGyWvC14Wm5isxfQ9DsK1AiJXdudltPBZpzhOGVUig+hNUpkL3Lz5m6VS
	C94XwwaDVPdVmv0Sm8ah+FlHDJviS22y4Ad6YPYXQRBoC3V8+BwVDTa1hT2RnP5MvoxBXYbwcPS
	Dtdp2xTw/sxYVPRIFowAzR47RcUfCHhpj1yCjC/PN6g9bLfFG3BcZtQrjJ+Fe3qJiV47pzTjU5P
	jyps6a/T/IA0LXomHYj/4MP2wSuaLU4/OBQ4q9NLi5KQ0e2zQeWtmqC7MW1ubT6Ja1tvtRgsQIp
	SU4eXV8FvBFuAN9+yiwb9oXbz70EQKYfy06NxpMKgY31wRo8e2Xvt5HJHkUqJU344MloQNQpx03
	4ZVvHrTN8mxyyu/mrftccslwkaIzVly4WYSu8uFGDWy0E0NE21PmVXkAb4AF63JI5BmXWdkFkB6
	BlaQ5tbHHdsIDUL9SCfgUBhd/TSnE1hXUF2t19biuu7E/GzoE0=
X-Received: by 2002:a05:6830:2690:b0:7e6:d384:459e with SMTP id 46e09a7af769-803fdfc94ffmr847414a34.3.1789073730048;
        Thu, 10 Sep 2026 13:55:30 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60fe54asm635779a34.15.2026.09.10.13.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:55:29 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Stian Halseth <stian@itx.no>
Cc: linux-block@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, andreas@gaisler.com, davem@davemloft.net, 
 glaubitz@physik.fu-berlin.de, regressions@lists.linux.dev
In-Reply-To: <20260901173947.3292110-1-stian@itx.no>
References: <20260901173947.3292110-1-stian@itx.no>
Subject: Re: [PATCH 0/2] sunvdc: fix silent data loss under LDC congestion
Message-Id: <178907372879.484803.7974471214841698578.b4-ty@b4>
Date: Thu, 10 Sep 2026 14:55:28 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 01 Sep 2026 19:39:44 +0200, Stian Halseth wrote:
> Since commit a11f6ca9aef9 ("sunvdc: Do not spin in an infinite loop
> when vio_ldc_send() returns EAGAIN"), Linux guests in LDOMs see
> occasional spurious write failures that manifest as filesystem
> corruption. The failure signature is:
> 
>     sunvdc: vdc_tx_trigger() failure, err=-11
>     I/O error, dev vdiskc, sector ... op 0x1:(WRITE) ...
>     vdiskc: writeback error on inode ...
> 
> [...]

Applied, thanks!

[1/2] sunvdc: unmap LDC cookies when the descriptor send fails
      commit: 0c6da21fa35e03fc74f09895433ccd6d4a9c3530
[2/2] sunvdc: fix -EIO issue due to lack of retries
      commit: 5067d4ba713961d8ccea1e06cd4c453793f3121e

Best regards,
-- 
Jens Axboe



