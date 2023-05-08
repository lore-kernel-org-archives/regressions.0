Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0003C22
	for <regressions@lists.linux.dev>; Mon,  8 May 2023 09:00:14 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-50bc5197d33so8136571a12.1
        for <regressions@lists.linux.dev>; Mon, 08 May 2023 02:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683536413; x=1686128413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBzioUPmPxWqOkTI6gwe94hiIYOth3djVQkKcgaJJpA=;
        b=ymGaXjTcqrqZoMVRQkQ04gJL1AHkZPPitqc4vcsmL/ha+FwwjIfcFM3DFC+Wq2bw/y
         7eb6+6xQmYsdGNpZCRb0LFi980txKsKV/unPFfH4uF98SYgMIO4MifSicgyTEbOoLiNZ
         iyhTefQR1/ldbuV4GnhLqtp4mJveVIZKydS7qtpq9bHfNgFklzzj/oD7piCvjhCkgaLg
         Wsx/xQrCgMrwxtxcdViTpkzjBBfu/yxcOXgGbrpRsZF4pr9M4j1LH6TTGB75byLS+Kwb
         fTNjWO70B69m54FyeTbphR/aq5qrYJWOlXpQUJZ8jrzubPjQw1X13limcPlCOWuJd6xX
         8qGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683536413; x=1686128413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBzioUPmPxWqOkTI6gwe94hiIYOth3djVQkKcgaJJpA=;
        b=QxK9FjBJrD0KQAw6HhXaJPfEOvbx/bsihUskcc0uE6GifAKQ/LOUTRkkBX6l/NBQfQ
         wdGZeNgR9W/9XHz/Unjtc4t71fNvu/PC7OqICEhIBOTyPIXuTBIorZmTXhUAZvOt/PEt
         KGHbWsDTKkz8+Rh1Jnd5wDg61fTEHi9ukDIWf41Ve5QuYcSjrrDy6akQWX8Wjl6NnIdK
         PR0XcZU7f8BwJ+pmqj4Wx6BerG3ZIR7Uzb0rS512v0kSNNwlr8IZ20KEDkjr1mbx0ya3
         cCuKP41ErGeD/D6Mw3SsLwB/TxzyXDhk3kU6iwI0pwWwI2J/+dYX+cXvJMR7f5Wbec7f
         57AA==
X-Gm-Message-State: AC+VfDzxBBU5+/PPnCL8gxOScQUrxug63BbfR6+KrLOk7JAAJ9JPMrw/
	EaS6VpYoDB3/Idu27ixLiSm7uQ==
X-Google-Smtp-Source: ACHHUZ6Fj426vCUbioccDPAAlleFxGw5RQLbiaE0CVoWWeV1G1vSEI4G8XcRqc+GdlepxttZ4QqZcw==
X-Received: by 2002:a17:907:9482:b0:968:4d51:800b with SMTP id dm2-20020a170907948200b009684d51800bmr941959ejc.1.1683536412950;
        Mon, 08 May 2023 02:00:12 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id jz4-20020a170906bb0400b0094bb4c75695sm4718953ejb.194.2023.05.08.02.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 02:00:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Akira Shimahara <akira215corp@gmail.com>,
	Ivan Zaentsev <ivan.zaentsev@wirenboard.ru>,
	Stefan Wahren <stefan.wahren@i2se.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Stefan Wahren <stefan.wahren@chargebyte.com>,
	Michael Heimpold <mhei@heimpold.de>,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] w1: w1_therm: fix locking behavior in convert_t
Date: Mon,  8 May 2023 10:59:45 +0200
Message-Id: <168353638584.78189.6729435069680377239.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230427112152.12313-1-stefan.wahren@i2se.com>
References: <20230427112152.12313-1-stefan.wahren@i2se.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Apr 2023 13:21:52 +0200, Stefan Wahren wrote:
> The commit 67b392f7b8ed ("w1_therm: optimizing temperature read timings")
> accidentially inverted the logic for lock handling of the bus mutex.
> 
> Before:
>   pullup -> release lock before sleep
>   no pullup -> release lock after sleep
> 
> [...]

Applied, thanks!

[1/1] w1: w1_therm: fix locking behavior in convert_t
      https://git.kernel.org/krzk/linux-w1/c/dca5480ab7b77a889088ab7cac81934604510ac7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
