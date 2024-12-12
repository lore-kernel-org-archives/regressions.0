Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461B421147B
	for <regressions@lists.linux.dev>; Thu, 12 Dec 2024 11:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734001560; cv=none; b=Bf4fS1+yLU5otNC8g9b1Sda6iGmGPVbxANL9KVJkBru8RVCCViiqizH1LpTKXvZU83QHk6MZit84SPlkVMX+kNLkVBfjstwgbgjs4SX0FDDr6IWpISZCZZ3Aw8sa1N70xrhMZ5d9uCLhRSb3ruOy8amYOxLGRPOJ4UhlYRqTLDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734001560; c=relaxed/simple;
	bh=y8R3+cJ70B/8RL6uR55oK5ldOetQ0vFtfmsRFQRrx4Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=P3yuvkhrTR1kMej4fkCwzj17RKstQkDFd+HUbiNBn5SwVEwRCSKt6rfHCFGLDgq19d43SJxDcMO7MWP6MWbZNpGPEuxUKdZs/AhM7QhCUtc+j+3otQ++qDFGwG1dxBm2bmOvxGzoc1C74FDM0KmQC0z04tc+eblY/2BPYYV/YkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JYaaRAfx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JYaaRAfx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734001557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y8R3+cJ70B/8RL6uR55oK5ldOetQ0vFtfmsRFQRrx4Y=;
	b=JYaaRAfxwNUlRMU7aQNxem3Auk9Dl5QYXY/pQsZUSrjMAxC8S69BxHVX3oNvJ/7M4psSCW
	5TPb0Xb4T8H9O8Yvvere78QV9lYs4kwGXQyxSEftpvzahVhfOHAM+D6UcWdSoWNKGkvatz
	gpCcF1R4j6e8HjWWgu+9izYIvDJPShM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-EBjTHT1EOnGSQz12yWbu2w-1; Thu, 12 Dec 2024 06:05:53 -0500
X-MC-Unique: EBjTHT1EOnGSQz12yWbu2w-1
X-Mimecast-MFC-AGG-ID: EBjTHT1EOnGSQz12yWbu2w
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385e1fd40acso252958f8f.3
        for <regressions@lists.linux.dev>; Thu, 12 Dec 2024 03:05:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734001552; x=1734606352;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b17I4wVwDx/N+KOJByIynEV4MjVriLu3Q4f+Xu760Go=;
        b=JrKXE1THHbu7m9gJhi35s9Cvz5LLT77sVivvHnqnNQROtnwv71JKvdm8Q9tfSSyaJH
         C5/TskZ3DmYG2Doj4dIuVFJTIOON2i5NUA5VsBBm6geOInSeULckfT4o+x+NJuZfZRwq
         WHYJzz1dZ1KH/vukSWEyV7PvX3GeEcYaLDBAtItZEWqsnHmKJ6RiEC+fkHl5cemi7t7P
         FT7l4xkS9lQ8odImVVE0H+gnM2YN9FeiTK54jYay/cGu1URqtK1w1bFleEZTpV03MarU
         IliqZ4Pv6FQJF571jHrVGuMjLxizHgAOf5r90w4xeXk2V7rZYJKzTqjUIwRD08XQT+Wg
         0VIg==
X-Forwarded-Encrypted: i=1; AJvYcCV+uf1S68XMH1XDJskIHnfilykISXPQsCETSjslgb4ueI2mqpzmtKXHkvJx+VE0s3pLHLMW+6gr+u/EZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVy5/NX4P7mdyAjxEZTF1IHw50GFg7mHj7zJ4arQ3dsHAvFNyp
	zzPoRb36cEpCrHuoSDohjVoMXP0JkurQo3l+P7h4pqLuv4OCS2J24hBXr0CF6QvYMr38zIMN8bD
	Ou7jL42MAisp0wJMdb5Q1tIzablu28a6soeXwrF2pCT/CxaoQycz0MIL1wyj+
X-Gm-Gg: ASbGncs8trkP0OolbJznp9zeEUUOKgTlbrZdC0irSmhxWQ7tl7PUDP8i7ERTSj0LLzJ
	9vTjRQzCDJIWM+oJhaD9udCLLTuIZw/bdJx8dDJuAmLfHQlXjxJ6QDlDSh8OBEzYX6LILEvTU7v
	MwujeSjB0y/OP44IQREAR34bQUQFRA7BffJS8cw4UISUzQWwYU9odAdfjTdhjeOMgOgyglhTJYp
	LnHKw2ZFAIcrdoG4VjJTsOwS7kJyDSe9VYHorCUL+6rWo+6bgDHZgYvDvvpkVP/A3Tii6+du3+N
	5pZhoXXHalAp65bK+mqvHtDBbN/AONRzJLiEzlM=
X-Received: by 2002:a05:6000:1545:b0:385:eb85:f111 with SMTP id ffacd0b85a97d-3864ce901bfmr5282477f8f.14.1734001552644;
        Thu, 12 Dec 2024 03:05:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsjNFpuayrSgHHBa1FRUQVFGwVe0rOy1eihWuPgSfYokpYEiwBVfBti8HIe9PDLwRPTSbepg==
X-Received: by 2002:a05:6000:1545:b0:385:eb85:f111 with SMTP id ffacd0b85a97d-3864ce901bfmr5282454f8f.14.1734001552308;
        Thu, 12 Dec 2024 03:05:52 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436255a0d5dsm13244985e9.27.2024.12.12.03.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 03:05:51 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, regressions@leemhuis.info,
 nunojpg@gmail.com, dri-devel@lists.freedesktop.org,
 regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] drm/fbdev-dma: Add shadow buffering for deferred I/O
In-Reply-To: <Z1rBTcM4xbi_jrXb@phenom.ffwll.local>
References: <20241211090643.74250-1-tzimmermann@suse.de>
 <Z1rBTcM4xbi_jrXb@phenom.ffwll.local>
Date: Thu, 12 Dec 2024 12:05:50 +0100
Message-ID: <87jzc5nott.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u--LugWcSv8xy9LtlJ7OHl3BtLJnV7bRK-D98ctQoyI_1734001553
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Simona Vetter <simona.vetter@ffwll.ch> writes:

> On Wed, Dec 11, 2024 at 10:06:28AM +0100, Thomas Zimmermann wrote:
>> DMA areas are not necessarily backed by struct page, so we cannot
>> rely on it for deferred I/O. Allocate a shadow buffer for drivers
>> that require deferred I/O and use it as framebuffer memory.
>>=20
>> Fixes driver errors about being "Unable to handle kernel NULL pointer
>> dereference at virtual address" or "Unable to handle kernel paging
>> request at virtual address".
>>=20
>> The patch splits drm_fbdev_dma_driver_fbdev_probe() in an initial
>> allocation, which creates the DMA-backed buffer object, and a tail
>> that sets up the fbdev data structures. There is a tail function for
>> direct memory mappings and a tail function for deferred I/O with
>> the shadow buffer.
>>=20
>> It is no longer possible to use deferred I/O without shadow buffer.
>> It can be re-added if there exists a reliably test for usable struct
>> page in the allocated DMA-backed buffer object.
>>=20
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reported-by: Nuno Gon=C3=A7alves <nunojpg@gmail.com>
>> CLoses: https://lore.kernel.org/dri-devel/CAEXMXLR55DziAMbv_+2hmLeH-jP96=
pmit6nhs6siB22cpQFr9w@mail.gmail.com/
>> Tested-by: Nuno Gon=C3=A7alves <nunojpg@gmail.com>
>> Fixes: 5ab91447aa13 ("drm/tiny/ili9225: Use fbdev-dma")
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: <stable@vger.kernel.org> # v6.11+
>
> fbdev code scares me, but I at least tried to check a few things and look=
s
> all good.
>
> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
>

Same here, is always scary to review fbdev code but the patch looks good to=
 me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

