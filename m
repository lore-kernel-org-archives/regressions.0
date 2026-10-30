Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369027;
	b=ZJQwJH1rPVNcNPUPOfC6zsAPqyDbLTkbroAbgVzxCLlsn9IypUuGPOwVJoye+CzBcZOf
	 bxUH1KW55f/UMYgz88mR1Hgdn2EE8gIs/yk9LSAJiMK4N4cYXT+pEIFkDDmuanDSTq1EG
	 CSfMo/qNbGeHODax39cXGdBY7/i8cHrQ5IYRV7hB0MpRoZ6svIbRUcnYbRPCjTG1+BwLC
	 zgObk/ik0U2LRaFCD7S1L0ecPLLFwncyr3+HojX2Kc7xT9O30q+EOTpuXNGqd5E4kNIr3
	 XsPGYf20hd+JM7FNSuTcf3Xsskn8JfsggBRSff2W9DzkQMFV+RpmQ229N3+xwrgeMHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RNi/YV07iESSp5HzRPxOu8kqkEJ5qhQDfYYkAe+T8VA=;
	b=rtxRYEsX7Viee0VkeSm96NxDyhGFMk1f05/FhwDoU1g1ITU5CkXlsLPSwpkM+Zu1rz65
	 GgLB3RfHgKWgPKSU32GNBxu6neiTOYt7gvrq8COo3xx2KjAaVgoLC5OH/pCSR7T4m5hlx
	 DakmpsX6+S0ohUEJsUrj6QB3IOg2Lwg8yamzhKfAVltBKyu/OhkPWUJd8+HtiPC3PuqLq
	 c7B5JQ1hTx1CPQOPxutbIM2zf5SQGi5lEbrRypO0dntDQsd5sZeiKZzf+n6s1fDInVP8L
	 JeM1xQh3i3e0CG/cHC01iT1lVaMesJmq5OOFB+98kjS/S3B4AO0ikCeyi3cBpOtvPrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IsdTiNFq;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E795606A31C
	for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 14:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E795606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IsdTiNFq
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab41538192so631509a91.0
        for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 07:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793369027; x=1793973827; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNi/YV07iESSp5HzRPxOu8kqkEJ5qhQDfYYkAe+T8VA=;
        b=IsdTiNFqDIFsHPIIvndkuKtuYCqYwvqwWC4jX17bIz1PEjrJ/lBiavxp0WNDS4COGa
         Qksf3pdZPg/aaf6tJ+0jSUPWDYe0Wy5LWVbWStYIy5NIhLHMM/2+LIAt83b1rvK8fkMK
         MN09IDlIyQZYeHwc93pDc4KBTKvO8RTLyB55yCm71fkLYYTSgYIbCkWOB0t9PQKUxkMM
         D8zjF49reDDC+l+XrNVZcVVCaxzMNDZvClnJswoxR0T1QAVMTsBk9XIs4i7EmiZYSqLs
         X9gjFrsms8HqFTkMHD+GKC8x5ZvmbVev3X3QYLISDcQuCoYshdFm9IGZo99hsIS33TlA
         K3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369027; x=1793973827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNi/YV07iESSp5HzRPxOu8kqkEJ5qhQDfYYkAe+T8VA=;
        b=lMTMrX/ja08zVq0bmNmvC6CD6JjisMbBp5DpZMrvZhWZCEwyf01tatb+pzjMaNAgqA
         qQB54JUhaRgcTVHb19eR5mRL5s/MvxCmaXov1vgtDCBQvZLJ7DV/xZVfndT3HTxqlj6+
         yHf4k1b8gfX96CeA4kO5CuBPElKdfJJOXIscpoU5yMukrm6c4kbnldHqPYL67k0/Inzm
         cnfeOqIAxpOAaG/xWGGutVD6JWgnfFh2Oz/KwIwGAHr/H6kLnpH01I/+x7dU9zPnNnUh
         2U40F10AVKYQ5StfnUt7t007DcXPc/xXzQwI6tXoflZnjQ033Dfez+Dcz0bwbpU0LjHG
         J6wg==
X-Forwarded-Encrypted: i=1; AKwUvBy2Jy7hcifwqRWLN/vyveyInslYMYtw88ZfptuIWzJrfuhaTHRnVO8wvYJJjLaFoI5QPkvyVC1NWr7Esw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLue4X/ppWORC5tys6O8GfPI2Iu12tN6WkLdSkz/7iN2NOUICbq
	RgpFR9QM5aRIadRRNj92W55POUjLdPk4LSPrT4FhnZBuKJF7weOu148JUzcNS/jvGA==
X-Gm-Gg: AYBFou1LfZFd3MzQIwHXKNA6q1wpUmZ49mbMSP+x5DWx60jG6TUHKfJR1IcowkNxn/E
	uU8ZOTX6iI4NoCZkeINfqizDhtbwqSMph0c3BW5T74Ay2iarh61GaCJQnkWlAm1dpCEVZ2QudN6
	FqHSfunTLVPdIhoqX75dwuUJTSRs7SEhMovAbtehr4ENZVvkiNSPKUn36ksVe5o2F11VsEOzC1O
	PykKA+afvU3pgi/Di22AGl+9aDor8pL4qpWXyJ8BTTvOJywgTHmHG+s1dFbpk3viSamJ/EBSKCg
	Ny6A4bvG7HOCiAZtMus3u/gEaCv4trwItqjwYHtF/yeyXef0TSrLRM495+WbEyJ8BYfh+ntSysM
	S/vl3U6v5lplUq5f+F0wXoqQr67RI+eg7NwU+1E+TwRQ17H9L1DhP8YLLV8EUUxI/vDJzHn/mOt
	OIJt+Q2TYSjeCQKfY4GwyJsZ7HRw9VtIao9bEcHtqFRU2ZuX+dmkc/QY+ZwO8BgNg4aALTW/C7W
	66PdZgu8b0/w7/xrF760smbirMh1/kJ+PJyspdtLNkMV3vElijKqingd4H9F+FRujRoZHGQTyO+
	x9b2ZJOevauqEZSCLL1urag1Q8F8DuhVWarCVocyPqs530VLftlISoBHs1K83PgCvHamdZFZz4f
	LQqmpoJnUYJyAjVVv
X-Received: by 2002:a17:90b:1b02:b0:3ad:8769:8741 with SMTP id 98e67ed59e1d1-3ae8957453dmr1915084a91.4.1793369026593;
        Fri, 30 Oct 2026 07:03:46 -0700 (PDT)
Received: from cantal.lan ([58.136.77.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85f3e087sm2002137a91.1.2026.10.30.07.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:03:45 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: Johan Hovold <johan@kernel.org>
Cc: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Ravi Chandra Sadineni <ravisadineni@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] usb: misc: onboard_usb_dev: don't defer the USB device probe
Date: Fri, 30 Oct 2026 21:03:40 +0700
Message-ID: <20261030140340.3383998-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <auSdA8MfolA8OhdM@hovoldconsulting.com>
References: <20261030114705.3159093-1-jjc@jclark.com> <auSdA8MfolA8OhdM@hovoldconsulting.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 30 Oct 2026 14:34:59 +0100, Johan Hovold wrote:
> I guess you can look into replacing generic_subclass with having the
> onboard_usb_dev driver call usb_generic_driver_probe() itself or
> possibly adding a pre-probe callback to usb_device_driver.

Thanks for the suggestions. It looks to me like your pre-probe callback
idea will give the cleanest fix. I will try that for v2.

James
