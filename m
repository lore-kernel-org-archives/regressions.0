Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE83C179B7
	for <regressions@lists.linux.dev>; Fri, 24 May 2024 17:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716572114; cv=none; b=txQ9OM525KCliCuxKHvMwDi2OJfZ2+n+BORncvG9Ke4/q84vm1vDoLpi80q4oiqZYvWV3urrApJWmkVf5LuHYc/5bhhZajyb5sbVBvwh7URagJiflvehUZOCN9sAoq8bEPbiTCWUEZeG/07YWo5rQZW4bultZiIuo3XMSSkGfmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716572114; c=relaxed/simple;
	bh=X7q4I3Z2W8ceiJRUmxuw0oIfEkVA3C+3uJyWgUVv1N0=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=oawbCdIXLShvX9mM5azCcz3uR9GXSHmdJTSz4KSUpvoY38KR5v/de06J/hORIblLb4O2Xt8T9u8KQnIx47Z0Bul0Lk4PcYWV1PgugLzR2wVTmpIA9P3bRsRq+YGr2P2DHhM8xEWvEA0GmEbZF+2tWWUNDwxh6PIz+Zd1RIt9xJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=YZR9V8vx; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="YZR9V8vx"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-68185f92bfdso766180a12.0
        for <regressions@lists.linux.dev>; Fri, 24 May 2024 10:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1716572111; x=1717176911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/lYKjkuHWJ/tP+SWUmNPxY2vRmvZk0xnVEoyWXDsrM=;
        b=YZR9V8vxDbUx5E8Oc5vzWiUUlFtwqy6MjRijPJq7A09majcqOwkoA3PL7Dcs/r6odL
         qwURnAGVbgUvuYNICmwZyVMo01qbyEg30sY6vEZcVbMJogA9y0ywWV1wVw4Imaot5b8l
         EfKuTGEDuJB9VmjSqFbxf+HxwwQuiVlkAuzS3Ve0rSv+3OlVbcFDTNsFo+cycU5HAITH
         urXs/kOzeEvhfTOwNGtOQ9hTMzN4ZMKIxhUqSpi3MRHIGVF1Yj3USLrgxQyipmgozyPz
         aM/HvBgxsmwJWWH3TkeHzTqZH7GuYMC8LHP75NLHftyZi2JOBx8B8kzZICB/+SDDysb4
         4Dgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716572111; x=1717176911;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/lYKjkuHWJ/tP+SWUmNPxY2vRmvZk0xnVEoyWXDsrM=;
        b=FIxiOQHbUvrY3awZOw+aNqpP6itaU9hYdsujepWy8PpluOTrV1avH75JtHWapaEUgh
         pRq36j/YQhigzbimVrlN/gi+IwxPuL0EIGa/3g/OSgj/wIHvjzQkcw/UEmSk1FVF5rKb
         7At/HG5oIIJ8lkfP7yPaNfDNImNBGZ9mnvutHYaTECezpJMsgORJujcYJtICDSHgVhu2
         oJqkBZn0lmdkXlOztjzcIMhvSBsJS2+O9hRLi+/+ZKJaNdZO9zLv507KriodUM7oosPu
         D6K6xPwoN4E6Z/S73lCy/yR7auO12RhgAAl+vVnmQ04h8T/hVkhkHQXNM2GzSCQXY4S1
         f2Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVu1nSANTysIvrNwaf3vpYWDK806JT6B7t1lTtN848tsMRtKRcPbKv5l1aPkqalEbqaB9joOhcnXtwrpFegOhyWSwi5GVK3I56e0jo=
X-Gm-Message-State: AOJu0Yybsz9SMm/FQa8G5Gt2bMO7sMMCMMn1tyQjl3Arl+bNgc5NiLj3
	zxO3YjE47ipJiuqsQb3njZ9u3YZwV5GGdzJ1k75JMPKp1XK5VgiGqd5tZMCiPBM=
X-Google-Smtp-Source: AGHT+IHIs13/ijYk/c01n1Igl2g2Bp1b8sXlKJdcpDFmF1ecg8B5NT9tVh3ERgJlBBvoqmPuaM3uhw==
X-Received: by 2002:a17:902:efd6:b0:1f2:f107:5a71 with SMTP id d9443c01a7336-1f4494f2cc2mr25001835ad.44.1716572110954;
        Fri, 24 May 2024 10:35:10 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c75782esm16429155ad.31.2024.05.24.10.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 10:35:10 -0700 (PDT)
Date: Fri, 24 May 2024 10:35:10 -0700 (PDT)
X-Google-Original-Date: Fri, 24 May 2024 10:35:08 PDT (-0700)
Subject:     Re: riscv: irq-riscv-imsic-early.c:52:9: error: too many arguments to function 'riscv_ipi_set_virq_range'
In-Reply-To: <875xv3dt71.ffs@tglx>
CC: linux@roeck-us.net, Conor Dooley <conor@kernel.org>, naresh.kamboju@linaro.org,
  linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, regressions@lists.linux.dev,
  linux-riscv@lists.infradead.org, apatel@ventanamicro.com, anders.roxell@linaro.org, dan.carpenter@linaro.org,
  Arnd Bergmann <arnd@arndb.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tglx@linutronix.de
Message-ID: <mhng-44d7a1c7-c15a-4077-ac94-23985f686474@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Fri, 24 May 2024 10:18:42 PDT (-0700), tglx@linutronix.de wrote:
> On Fri, May 24 2024 at 08:10, Guenter Roeck wrote:
>> On Wed, May 15, 2024 at 10:05:59AM -0700, Palmer Dabbelt wrote:
>>> as a conflict resolution, which IIUC should happen when Linus merges my next
>>> PR.  So I'll try and remember to call that out.
>>>
>>
>> Unfortunately it looks like the conflict resolution did not happen,
>> and mainline builds are now affected.
>
> Fix is queued and goes to Linus tomorrow.

Sorry I misesd this.  The PR I sent Linus this morning contains my fix 
from earlier this week: 
https://lore.kernel.org/linux-riscv/171647463438.13050.6219786365640043025.git-patchwork-notify@kernel.org/T/#t 
.
