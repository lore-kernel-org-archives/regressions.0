Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E535958107
	for <regressions@lists.linux.dev>; Tue, 12 Mar 2024 08:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710233831; cv=none; b=d/D3JVEDHD6/2NCs7gGbMdLDIm1M7675PRBlXKK5+Wzfi/E2N9lDzzUUotZZa6gZ9EwaxZ0oKbMFSrz01/VfpZw3b1uHFmBVlnyVJyYnhs3CA5gRY0jShXcaXRJF6EbOQzUfnF7mby8fUPq+Xxx3+Jd6MKnt7V+280qciqIQR3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710233831; c=relaxed/simple;
	bh=UlMJzd/gDB5sUTKbx2S9Nzl9aIWaPq/EsiZfHz21XqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sZL3HOPwAJlIOVSgvJ11K4/Wn8xa0QLrLYcBYGpkeWNh/D7bYrswEiSnTXVo3v5jxS5vj6ypnJu0UzuK04a8GudfxHT3vTyT1hpdSropxCuRbPnPurS0OT8MkOL2NrQF1/P9bFUbs/U7S4c1BzhDpafnMTw/vOnvCFKHKBocHlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz; spf=pass smtp.mailfrom=sairon.cz; dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b=bIZO0yJH; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sairon.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b="bIZO0yJH"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a450bedffdfso680429166b.3
        for <regressions@lists.linux.dev>; Tue, 12 Mar 2024 01:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sairon.cz; s=google; t=1710233827; x=1710838627; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QhCrqc9bD+KT9H4giiYB2giSZhWzm3l6by2+kLwIxWI=;
        b=bIZO0yJHRVa4hO2D9hmqX2V1evghIv7JtDhVgiZGZ+Ab4l91M0swb/T8I/axWZsppI
         nlzGcpHlG6GdFcCS89P5M4GrxbGmTBqhJNzA8RVyNpD72n908Nag5pif7MGSRZEsJRUr
         65Ax1Y7bY5v5NbwWlBG0r1QjmQXyw9m/2Pj4lgI/ugVXoAJwkuAP//b7qW2/jGdSLEZs
         l/ses/kjOzUcVOxOwx5ui/PYMUVcsh/sLGZcRs6/EJIro67NHm69e52U9hdlLTkZctFR
         JMgjqskw9DZ1ga37jFEQV040T4qgwJUZ5GGdGE5ukx7whEyCU/Jh22zCNIGvTihUSBSD
         7h3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710233827; x=1710838627;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QhCrqc9bD+KT9H4giiYB2giSZhWzm3l6by2+kLwIxWI=;
        b=ON7VdgvWBZAxc9rtVC5xaqB3SE30HU+uP5EKWCaafx3VwUsbnB0eiuyLPFxdJbPOX5
         Ri5PrZLNe56vadKdmgmgdAL2tOoiDhTtZhb7x94hlLrxSShYW0cF2U5QyUXCnqz/tPGc
         /dGsY4Ys0K/IRVe+eO9ADDQUyz+NcHtmnN4dIv+ZISj9x7dncJOWk2oFYRSulK+7r3ux
         MbxxDyEhE9FX3xa/RwqxUD5WOdY3TbKVAXi0AYriqzvBvTXh25uLbqfhxWN1Zo4lrASh
         mLHzQ1kzq2vLTxF+YVUBX9xzsF2m0ixQNhRNAhSGJlV76/6XZcFiqXpy+CY5prau362K
         jsag==
X-Forwarded-Encrypted: i=1; AJvYcCX0ymbC0+gKpSp5D1A7LNIn434c/rDbmPPScLNLuVRU9CXnXvnl9awVA8qtpYbOb3JXeKzYac/baeA71jBlAWRSHZz34WayVmtI7Z8=
X-Gm-Message-State: AOJu0YyHtd1YbK05UkqRLouOHnQ37ErjBYttAB9Rdq5Ca+Azdm8YxzYB
	zf/v+A1FqJQzMK2gbN5glZSrcoUVCpN7qOCfdWZjDN0ziVPrZIyyolsxdQQnjvw=
X-Google-Smtp-Source: AGHT+IEu1h4FOpeTvq7aSX9jZuewrkWBKXUROXQ435fNFWo3yeT3EFO+3vOYS9MNpBAFnKppJ1G+8g==
X-Received: by 2002:a17:906:5947:b0:a45:c931:5703 with SMTP id g7-20020a170906594700b00a45c9315703mr4637559ejr.70.1710233827060;
        Tue, 12 Mar 2024 01:57:07 -0700 (PDT)
Received: from [192.168.127.42] (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
        by smtp.gmail.com with ESMTPSA id h19-20020a170906591300b00a449756f727sm3695068ejq.147.2024.03.12.01.57.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 01:57:06 -0700 (PDT)
Message-ID: <92d3d802-73df-4ab5-aab4-b2325512e98f@sairon.cz>
Date: Tue, 12 Mar 2024 09:57:06 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Re: [PATCH 0/3] USB: core: Don't overwrite device
 descriptor during reinitialization
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg KH <gregkh@linuxfoundation.org>, Khazhy Kumykov <khazhy@google.com>,
 USB mailing list <linux-usb@vger.kernel.org>, regressions@lists.linux.dev
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
 <1e954652-dfb3-4248-beea-b8a449128ff0@sairon.cz>
 <4c3ab861-0274-409b-aad3-7cfb53dc2308@rowland.harvard.edu>
 <00f0786b-a9f2-4f73-8d23-3b1fa4c8b77e@sairon.cz>
 <60def275-5237-48df-b37b-ab886f4ee017@rowland.harvard.edu>
 <4c2a410b-2997-4a7a-8fd6-2bec819a1c4f@sairon.cz>
 <4a168b8b-f012-4b36-92bd-83aeb6849410@rowland.harvard.edu>
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
In-Reply-To: <4a168b8b-f012-4b36-92bd-83aeb6849410@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alan

On 11. 03. 24 15:43, Alan Stern wrote:
> Well, at least this means you do have a way of using the device, even
> if it is rather awkward.  It might even work on the Raspberry Pi machine.

Still, I'm looking for a more permanent and robust solution. If it were 
only a single device I'm using myself, I could come up with a 
workaround. However, this is one of the very few available Z-Wave USB 
interfaces and there are more users affected. So far we went with 
reverting the patches, but that's surely not the way we want to go forward.

> The device is so non-responsive, I'm amazed it ever works at all.
> Judging by the usbmon traces, it doesn't look as if it would work on a
> Windows system.
> 
> Actually, if you have access to a computer running Windows or Mac OSX
> and you can try out the device on that computer, it would be good to
> get the equivalent of a usbmon trace (something like a Wireshark
> capture log would do).  If those systems manage to do something that
> Linux doesn't, we ought to know what it is.

Fredrik (one of the original reporters) is following this conversation, 
here [1] are logs from his machine with some details in the ticket [2]. 
He also wonders why the initialization doesn't work only on USB2 ports 
but works on USB3 if the initialization code is shared between those two.

Also, if needed, I can get more logs from the X220 I was using for my 
usbmon traces - I believe I have an HDD with Windows 7 install lying 
somewhere.

Regards,
Jan


[1] 
https://github.com/home-assistant/operating-system/files/14563813/usbPcap1_USB2-port.txt
[2] 
https://github.com/home-assistant/operating-system/issues/2995#issuecomment-1989329739
