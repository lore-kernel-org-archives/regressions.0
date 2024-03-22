Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DD447A40
	for <regressions@lists.linux.dev>; Fri, 22 Mar 2024 14:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711116750; cv=none; b=rpUzp2AjUCN1LwvWVUTt5eX8fyTxOL25pkQIfrY5crwkU8rmrxNd0JX+u7oHTUSoi4QE/HQICtqxkMBZ8wHjw+KF7w1H/sHSu53bDqosVRd4vt/i4Yu2DUUIdDoAipKb+nS9Mmb8ui7EDY0t3T3dvbmuIr8tTgTSlVAv4ZfB2w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711116750; c=relaxed/simple;
	bh=xaP3sAbLubt6f1b7wDUbIs8Zobt3RgckgcUvcMqq0tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cm1iQidk/R8qXbkXR/WxFj8/QwmbbM8IXnAUFfgH98hUqE9VgUHrAi5KYcG+3tFrkcpWp3CeH8x2vTlf1Zqe5DLSuNeo5oi0fep0b2OzPjLh32xWFM9VrnpPdx3KzvIJt9F9K6qH6tR70WTxGsuAc97QxCHCZGjn+a7B0NePrJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=hRO5wmDE; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="hRO5wmDE"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-78a15537fa1so128828685a.1
        for <regressions@lists.linux.dev>; Fri, 22 Mar 2024 07:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1711116747; x=1711721547; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ccm1mtAb95qdb6lkqB0FItmGid6eaARPcUgc6MW739g=;
        b=hRO5wmDE1RLgbqL+/rMRg5s8+ONuePJnMU5WXZUKVdYM8JTZft8CMNnKG6J9B/JKw0
         IwTKfqUoygxxvhZ7kCUsX+mWCd8c4wbSF+NV9gYZWs0ZWLuKF/pYOZrMqVxvjR0ToWPy
         t+qzPkZruMbGRky8R2E6pnt53EE1ZqCKayCt4Qq8K7FjdoQjsp58DiznuSMZVLNg6Rh8
         I0eud8LfecA5D68Arwt7An5dZYpaGrHZhD0Aq98DpU33No85Xrs5NZThBxB3qaOrqDWt
         wH22k+AOBjfGvTAxi6BfYJMtwP3uxzp3cE4f1VzDhETunV9hqTHYUtJTJnaqnBze6DHP
         Kp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711116747; x=1711721547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ccm1mtAb95qdb6lkqB0FItmGid6eaARPcUgc6MW739g=;
        b=gkh7UFq+Hw9G9IkTdIKjiL9HqW3OfFiJvKYlx+8ZgzY39/buqTJ+cUff2ZF+75S/h+
         rPIwVRIKV6XSjdsisW/r0tabBsWyxO0Xl5Rz0XDneujIVJMvvPzWtUs/hRkwiiHg7u49
         XsvCOUJlcAxS0WDx9sKiXAE60HwOEts84dqquZPJTGkI7nh3g5L9X9vnZ6UE1fo/601U
         I0O85HzyWAnaldHTQHZ0UC42kgOxehEPCctm1zRQvvFo2aQ/8R1Ux91q/0Kxw6uVrG3h
         2N1va39fhl7OJ0m36N0YOkxaeG5PtUpN0z+d5pLJGoijz6B1z9hgBezkqPF7mPFz1XoG
         j86Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbo+l54JFPqHf5ByNh5t84Pgt3Qm98RCfSLCTywg/DHhHxKniBlqxm6Dry8El4xHgqJnfNHKCcSfTCcH/LqbIuaYPS5UUnVn2n+Mc=
X-Gm-Message-State: AOJu0Yxq14X60kw57dVmIG7UDlSDR9bBTyvkWrRWcPGXPIs/X/7EDC40
	7nLAW0Y9J5FqfhCL4vrx+9mucZ8EPhHg0+MHMR8Iufvt7QNOVCwT25RIRZKynwk=
X-Google-Smtp-Source: AGHT+IFnfaJOCDK6cUge2Q0kmiLhh1+As+3fWIT4dvDOMO5Q9mrgQY3RBqSVCXK7jYSLUb7CSofK/A==
X-Received: by 2002:a05:620a:5605:b0:789:d306:879a with SMTP id vu5-20020a05620a560500b00789d306879amr2427097qkn.7.1711116746679;
        Fri, 22 Mar 2024 07:12:26 -0700 (PDT)
Received: from [192.168.0.50] (dhcp-24-53-241-2.cable.user.start.ca. [24.53.241.2])
        by smtp.gmail.com with ESMTPSA id bj23-20020a05620a191700b00789f34f225dsm782925qkb.71.2024.03.22.07.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 07:12:26 -0700 (PDT)
Message-ID: <193a134c-f0da-4a45-b45a-a3605f91cfa4@draconx.ca>
Date: Fri, 22 Mar 2024 10:12:25 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: Sun Ultra 60 hangs on boot since Linux 6.8
To: Tony Lindgren <tony@atomide.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 regressions@lists.linux.dev, linux-serial@vger.kernel.org
References: <d84baa5d-a092-3647-8062-ed7081d329d4@draconx.ca>
 <20240322051531.GA5132@atomide.com>
 <d7337014-09ac-8a35-7159-e75ecd2707b6@draconx.ca>
 <20240322064843.GC5132@atomide.com> <20240322090657.GD5132@atomide.com>
Content-Language: en-US
From: Nick Bowler <nbowler@draconx.ca>
In-Reply-To: <20240322090657.GD5132@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-03-22 05:06, Tony Lindgren wrote:
[...]
> I can't reproduce this on qemu-system-sparc64, probably as it does not use
> the sunsab driver.
> 
> I noticed something though, I think we need to test for the port device
> instead for being runtime PM enabled.
> 
> Can you please test if the updated patch below make things work again?

Yes, with the below patch applied on top of 6.8 things are working.

Thanks,
  Nick

> 8< -------------------
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -156,7 +156,7 @@ static void __uart_start(struct uart_state *state)
>  	 * enabled, serial_port_runtime_resume() calls start_tx() again
>  	 * after enabling the device.
>  	 */
> -	if (pm_runtime_active(&port_dev->dev))
> +	if (!pm_runtime_enabled(port->dev) || pm_runtime_active(&port_dev->dev))
>  		port->ops->start_tx(port);
>  	pm_runtime_mark_last_busy(&port_dev->dev);
>  	pm_runtime_put_autosuspend(&port_dev->dev)
