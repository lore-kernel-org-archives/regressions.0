Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417102;
	b=edDH+EkQYdKXFYTKPODmD+Er5UN0/GLe0AB6cb8yk46guOY4dU7d6pBe05qUy1uNBa9m
	 NDajNuf+t+3BmnJwO/rOuO05lxhUC5aVH/lIMPYWRsAtQtzRNCuResKg4A8E8XMI76Xb5
	 cMqLYYbcxhDzKp5V9fSf9FmAKHfg6GEMEkoD1klEj2urhBiB1ozkdSyFuU0eP+qlisUcI
	 xbag5czuOKAZFQk71ypIdV/LSN4LZXD3Vikw1JX2J9+gijCx++WaCfWUOe39Gx35xHomQ
	 WxNrAJsZX+56EWmD8Y8Eaz3EHN1I1URVkt1IIgFsTpaeEMwFBRiv0+Q/AQHKzshh4ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xjFmgriWXzydd1YKnmihJ3tonTeyGDj5VqBui4OA5C8=;
	b=p9ChY86CaIkRdzQWILBYYTfYu/RxG2nUb+yTxf0dMhQafCUetEuR2YuGRB6l4nDZLQiA
	 cCO0n9ihZrIj72DegfaWrTbUZUXOJiaJ/Da4rwyhJ1A5eOO0/Epp46cpU66nmNr/c0i/U
	 RQ6TFXRu0w03zZKEUfpEuhO8eHEfcWKG8t9B3FF4WiCs2dk99sV3PbTMOCw2M5/aqommu
	 o6Qj7CW8hkA/CxGt3ixnpzQ/h5TzWP/qgsPgwN1AO+vsUPzpDV2mal9gSmMGjJM6oIf1I
	 xJnKY04ZJUsVYiREgXJEw7bP69/BsBIyMsmRlXyA5Npk+ECoLHtBCK55l4IHcr01r4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13379606A321
	for <regressions@lists.linux.dev>; Sat, 31 Oct 2026 03:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13379606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso8253435ad.3
        for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 20:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793417096; x=1794021896; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjFmgriWXzydd1YKnmihJ3tonTeyGDj5VqBui4OA5C8=;
        b=LKQ0FFxLI6uB1bJ0tqtw6QcH6/a13eITOx+AM6bRhsKH2ck+ofHp6ZE6isO6QaP6ke
         CqWL2Mb50QW31zxy7gk0zRjMYfxZwDu8mgVVPDnVB6ZgUzGZ/p1T3ILPoYze1Uzu4Tm9
         nkOBcs86eT+0wAey13DVSsZO63X13sHC4QLG6Z6MeSBAhzApmslcttWmrAO+vB+UypCF
         FxWGTU4kP+e0hTXH4QMG6XcXGNC4MMyfPUlBszczsv/zjHAM8Jpr9RixXInCL8oswJwj
         z1JbQ6MD/t8UCCbBlMUpN/97uNdEbeSRii8FNs75f0BUjBGix0OGCEZF7yQLDi37ecjd
         8snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417096; x=1794021896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjFmgriWXzydd1YKnmihJ3tonTeyGDj5VqBui4OA5C8=;
        b=zUYnUykGk/WSLhfLM08gYRTnU4UdCsjrbDI8n3ieA/NGrpl/P88/9EUN+QL4z6YRVb
         rqsPvdaQDtoLaxCGZIUoyEvQQHhSQ+0GN7TPq5mUE2ZRGy8Kb062mDim4c9PecY1oAUE
         bmuPmT5n4tMCYamokK9Av5bVtJW07cGX+BP1s3dwpm7KHTEPlfR4OggnQ3KLSL6ikGbu
         fxyj6iqXlQjT+QCgfSdylEX6n6ZrsmaCRFr/1PmxTJDCk52OxNnoFJciv330UMIcqBkS
         C1zd8ZzJwirMNVW+x6F17MWtUiD3hF7FZh4xCf/380LEBHfk3KbykER9EPEbe4ANZUxt
         4oQQ==
X-Forwarded-Encrypted: i=1; AKwUvByDsLe5AIqr6RDeh4XG0h3BXdGObeteX7/9/3GQn3QjQCCU/+B8FAuI6+sCfqUU8Sha6MGu0H0+EPqSVw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIcrYh6B+cmXeqR072TG12kCsaPr0WIPBDtAGx8QnsnCAf95OwZ
	Tk8eQN8zFv8nHHiULTWX4V3VJYGnx5KwBQxF4OX0XdUZPPqEhw6b4Cx/aGkZ0uh6EA==
X-Gm-Gg: AYBFou2A10KJdSkT5lqwnyd3FEbMwV1sjoup28mvbpH2VcGbbtRHlcbr8/Z60cxKAr+
	9z9miyGtN9Su1BMJianhvw02fzi6iDq9sbcg4sWUHgJJy0aYTEm/NBd1s++P4Bga2B2emxlXXwk
	Xl3I3noYBbTiJFDZSvJl9HkLPWY4NLjwr45I/VZhLIxdPW3a99DBVcmyYIynPQcVZeMAXGAhRi2
	ApGGNWo3TWdZoNzlw2rDn85Q28rwYp62bmb9yVi6MtMeJQbN7GpDW5E4EhPvHxtCcgzcSfG7tsV
	JKBX+N9vBN2IiBnYpfYhHYxI1BBsGVt7ooz2pXwncel/zKhBeYv+l1+0qxUAv8rV1O6yWuN1Lfa
	eMiG2eYiep+H/7f6LPoOtlpNsgqaVMbxEGHHLbcicxwbF38hGnuzIjemtrtDcFqT/Tpztb7jdAO
	YsJzTyTzrz1wLE6f0FuDTaVd1PJoPFm0pbLSsMWMfx3oUemSWpkPOFA4nAT9HG/jZv8mznDOtn7
	NJtpNVltoFoT8VEPF2mghfHE9WymzADRfdN1WDWqBbJ4H6KJfTKt90EsyPRYJaIVN7NTbGJRRdN
	C5/3haJREyUHiv4jkNChamOdhH2aCL4/8qhxCA037UMt2mHF7fJlbF64wjr1K9KiYsZWZO75a5C
	QS+s6RF2h6BTuWJkx33708wDQ0/nLlS0qCvDdyw==
X-Received: by 2002:a17:90a:ec8e:b0:3ac:a203:e0a1 with SMTP id 98e67ed59e1d1-3ae8980ede9mr2974708a91.37.1793417096261;
        Fri, 30 Oct 2026 20:24:56 -0700 (PDT)
Received: from cantal.lan ([58.136.77.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87f99899sm2940976a91.2.2026.10.30.20.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:24:55 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: sashiko-reviews@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v2] usb: core: add a pre_probe callback for device drivers that may defer
Date: Sat, 31 Oct 2026 10:24:49 +0700
Message-ID: <20261031032449.3536559-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-191184@kernel.org>
References: <20261030151919.3511106-1-jjc@jclark.com> <sashiko-outbox-191184@kernel.org>
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

On Fri, 30 Oct 2026 15:41:34 +0000, sashiko-bot@kernel.org wrote:
> However, err_pre_probe only invokes udriver->disconnect(udev) and does not
> undo usb_generic_driver_probe(udev) or usb_autoresume_device(udev) the way
> usb_unbind_device() does:
[...]
> Similarly, on the -ENODEV fallback path where udev->use_generic_driver is set
> to 1 and usb_probe_device() returns -EPROBE_DEFER, won't leaving
> usb_generic_driver_probe(udev) and usb_autoresume_device(udev) in place cause
> the subsequent usb_generic_driver probe to call usb_generic_driver_probe() a
> second time and emit a duplicate USB_DEVICE_ADD notification without an
> intervening USB_DEVICE_REMOVE?

Both of Sashiko's points are correct, but both are pre-existing and this
patch does not change them.

Before the patch, a probe() failure returned straight after
usb_generic_driver_probe() had run, with neither the configuration nor
the runtime PM reference undone. That has been so since commit
c9d503370f24 ("USB: Make it possible to "subclass" usb_device_driver").
The -ENODEV fallback has re-run the generic probe under
usb_generic_driver since commit 88b7381a939d ("USB: Select better
matching USB drivers when available").

The patch deliberately handles a pre_probe() error other than
-EPROBE_DEFER exactly as it handles the same error from probe(), so that
the fallback keeps working. This is stated in the kerneldoc. The only
new code on the error path is the disconnect() call, which undoes what
pre_probe() set up. A complete unwind in usb_probe_device() would be a
separate change.

James
