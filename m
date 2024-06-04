Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1151420DA
	for <regressions@lists.linux.dev>; Tue,  4 Jun 2024 08:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717489302; cv=none; b=rs6lhgNS13VN6n1Vf6sHH8z6y9HWJJpMyTGULoGKkTe1hTSzrrQyKs1qIFO0mP7F3Ny5pxvQwj+8ABocnkNi06ZtVh5wZB4YnZqoE4a2IQHRZAV523f/xw1ENMxwlo+IQkJZUph4q62SOcXMOUl6PX0WbP6bb4vRnwF47hOuKnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717489302; c=relaxed/simple;
	bh=xEmTz73vHv54ArGvlNCXi6ctPWx/IZMfFfBcTS0dumI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HX32ugNbD2yf5oM3Q0oxhkjzMh6pkpm631ruRR7Z55duL/kLEvmhGWYShNTc0n7SseZfShKCMQL8ScGZgC1Kaw7M5uaMh2C+n5puqMhnKjs7P4xphpsWoAgotudNZPBaVmmQve6zgpFhVvCfLQwWlR850qd6poGQWddfHXftYLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lZblehYd; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lZblehYd"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57a20c600a7so5857199a12.3
        for <regressions@lists.linux.dev>; Tue, 04 Jun 2024 01:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717489298; x=1718094098; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TANhGRUXVf1tnEOVOMay5ZJ84risT5rFmO6tGy0VoLg=;
        b=lZblehYdG0tqz4qZ9XG9EXuoS2eODpQCT0OQN22TfbPIw0H/HLZn3xu6FSIZW/0WsN
         sUEXz9EV1rSUkYDcPsljDJ+bjQg6ccLq4CbkC41GrWoqbvF1vWnv3AilHLmelpYtKj/k
         5ItNYdXPujkKudY5SNubLhOQUv7e+JfmeL/Ho2X5jx+xBAfgjfSsv4+4hH4Zs+avIY0d
         SyyLBKfes/8dhtU73hohF7DtXX9ev5x2ji1Lt+VQrkClVjeOJjQ8VtE9+UKgfQLE+PZU
         zZbLDEcX54QtYZgLRHAOpwB+HRNHsZv27U6Ht0LjWmwAjiBOZAx9EPU/wFS8yuNPkRvh
         Wh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717489298; x=1718094098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TANhGRUXVf1tnEOVOMay5ZJ84risT5rFmO6tGy0VoLg=;
        b=DZaWcrho9RvlGz7G3yz4+sAHvi1v3FW1XThTD2iT3pSrAesSlW8rZBIsIzxqz6pphr
         JJx0hchNBa7D915U83rJTqJZBjSMgwONYU2XO8HF7xQ7cd59KmDUpT+fKIMTWzxwd1dW
         YmpdMS2+Xulg8Y4/NO66+h1P/hrb2JFhtH3qjpCJGXs506YY4Ai2+eDbYsKf/uEInDDq
         fSN/CPgJErNwXtaNDnh5mflsU7fnkVi/0VccJRaXZI2R3ng8g8tyPA4hJyXZPwlsmP/R
         FJPcSLRe9hgJQNCgvr8M/JDpd/04MyfIDCnvh87Xzm3ePi9HoJhfCeXcJ3oXeIbttJSM
         /p2A==
X-Forwarded-Encrypted: i=1; AJvYcCWdk4LWdOdaHVZpuWrI00MmHV6ScZ2XZVedMZV7dPGwhiYeUWKhfYOyU0a5iTWCE5HO1c9gBe3ueOWdkopBifKWFxpZEs+/DF9Ma7A=
X-Gm-Message-State: AOJu0YxNVlj1X4l5B87wgdmZl3VD/vBd3pGkBMyv6vFO75vja8A+fISb
	bu3SjfTKby9/4/BgTJywjrAemYnUKiJBWpBb1I9h1WKaZFvVvREsBEmZjdwG9mA=
X-Google-Smtp-Source: AGHT+IEIawn+2ZBZBWVKRH2CiF9Dk3da2NmeyKuGb3+2mSkPfDnBLQSa+jBRzf/qk2aszlGoRqTNhA==
X-Received: by 2002:a50:9356:0:b0:578:2148:61f5 with SMTP id 4fb4d7f45d1cf-57a36448b60mr6977708a12.30.1717489298219;
        Tue, 04 Jun 2024 01:21:38 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a5ad20b97sm4240233a12.44.2024.06.04.01.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 01:21:37 -0700 (PDT)
Date: Tue, 4 Jun 2024 11:21:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, kunit-dev@googlegroups.com,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>, smayhew@redhat.com,
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>, npache@redhat.com,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: kunit_test: KASAN: null-ptr-deref in range -
 kunit_generic_run_threadfn_adapter on qemu_arm64
Message-ID: <81d3f794-a19b-4b62-8c21-7c6ef9acb552@moroto.mountain>
References: <CA+G9fYuJtUV_Z4x74qYZDDOkbHP3SJbGvHskFNnsOCxOmPvr=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYuJtUV_Z4x74qYZDDOkbHP3SJbGvHskFNnsOCxOmPvr=Q@mail.gmail.com>

On Mon, Jun 03, 2024 at 07:39:24PM +0530, Naresh Kamboju wrote:
> The following kernel null pointer dereference is noticed on qemu-arm64
> while running
> kunit tests with the Linux next-20240603 tag kernel.
> 
> This is always reproducible and the system is stable after this.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

These are intentional...  The function name just changed so it's showing
up as a new bug.  I tried to add a big printk before this NULL
dereference but the printk message never showed up in dmesg...

+       kunit_info(test, "Testing that a NULL dereference causes a test failure\n");
+       kunit_info(test, "*** This will lead to an intentional stack trace ***\n");

regards,
dan carpenter

