Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A30C146012
	for <regressions@lists.linux.dev>; Mon, 22 Apr 2024 10:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713782550; cv=none; b=eupTmu/8aeyK1Q3nMP5kHdNjNbicg9s11SScHWj6+1bpXkGLdP8cj5YbIuJNEcPoc64WvKIxD4GUB1l37seIP8M/XzOl69XELITM/QSgbCfdyg5rIEzxNJfOJ/ZpwClfiPsVzLjbk5zph0BzAtLhqV6N/r1TfjAb/Ik9yPxh7aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713782550; c=relaxed/simple;
	bh=pPv0F9B7dGBas8/9IU9XWvrJKMjRjapiCH6m5RmERd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TNypcQKyvk/Iw7xYtuXY7O3ZNk6bn5ja3S2iXxvfcPC7q7V/10Y5v+tTs18lt/VNOU2gyH8Bwfq6+2qkxPa255bMFu0EpPnoUaZ2BKhZBFbpkk+L3svhozpEzYcpiDOOlwWQN/MNBNODZ5goVaGdLFd1RK18dOnr5h8m+nUd0qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org; spf=pass smtp.mailfrom=penguintechs.org; dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b=lEk4Ze/8; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b="lEk4Ze/8"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e36b7e7dd2so35937115ad.1
        for <regressions@lists.linux.dev>; Mon, 22 Apr 2024 03:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1713782548; x=1714387348; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w94qF8cC6iTKYV8wt+9+7HGOk6wH/vdndzcUg06Y5Ms=;
        b=lEk4Ze/8Apqi04919I4E/87jkNNcNgpupDEQp0h8WO6yg+q0b/4YQ0hfwwO1gKlKZX
         CZZrrYHYqSzZ8bxXLhPIpqB/a3fWc2at/zX8WRrhJ9YEDYafhVLmXRBUI62Zv83vRun8
         zG1GUppjnMvwzCOye3O+hIDeS1R+eGQsjlCx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713782548; x=1714387348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w94qF8cC6iTKYV8wt+9+7HGOk6wH/vdndzcUg06Y5Ms=;
        b=tOLPnf7Mp8LhBX6GMod5S2thaLNCbr6sT07XaBmbqOBsX+Dx3ZccaMIyYwDOI81RMD
         KJqi97b8GGEEtWPtpDcnaz90KId81UlOZakt8MdCiauNYIdu3iHZTxStMbtrRvFoqm2e
         pXq9zYVLHKauIpM7QNfA1pjhqqTyRs0Z/8UPLuQrIh3MIvq6OV/RKP35uJBQZUZy7M1s
         i6OemOMT7LU8MAWr3jhN7GWITsgQBTA6ZpvHSlxN8RljaMvzjjPa6QRqTPgfn9X4cA+U
         dRCuAJXxmcEdMqmnPEFEwe1IFlNcW3yG7z0kMCyRAwwZTcQ0Je/1GSfzxuzuGsis9fry
         PEOA==
X-Forwarded-Encrypted: i=1; AJvYcCWn7pfD8CW+q+ZtvXSXe3oxj2KhFWaEu1ElZDgTgOejtEX0CJiBf1mRFZz8NBeZ153JcC+4PtG7O+TS1ujdYfv5hllis+ehQ0lhc5Q=
X-Gm-Message-State: AOJu0YyU6jAoeUWaGkOtpYH6tH8vFhkNF111ld/9+yyWQ63JBRwSZYLG
	So5Tp26u1ilLYwC1f/bcdBREeVN+LmOu+gN+fF30Bznkg9f5WqL/ekmCMhR+INKeUVk2IIrlbTB
	d81dC
X-Google-Smtp-Source: AGHT+IHEKgX6ZB7PvhK8S7RSQnlSMdFkrfunyoE9zFA22nitUje8AnKM3QYR/6vQDutJdy7O9tH5FA==
X-Received: by 2002:a17:902:daca:b0:1e2:7d3b:353c with SMTP id q10-20020a170902daca00b001e27d3b353cmr10797104plx.18.1713782548372;
        Mon, 22 Apr 2024 03:42:28 -0700 (PDT)
Received: from ?IPV6:2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08? ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id kh3-20020a170903064300b001e48565b40csm7826758plb.210.2024.04.22.03.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 03:42:27 -0700 (PDT)
Message-ID: <5da9ecae-35c7-4968-9f16-3f10e04c2b1a@penguintechs.org>
Date: Mon, 22 Apr 2024 03:42:26 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Fix two regression issues for QCA controllers
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: quic_zijuhu <quic_zijuhu@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, luiz.dentz@gmail.com,
 luiz.von.dentz@intel.com, marcel@holtmann.org,
 linux-bluetooth@vger.kernel.org, regressions@lists.linux.dev
References: <1713564212-21725-1-git-send-email-quic_zijuhu@quicinc.com>
 <1713650800-29741-1-git-send-email-quic_zijuhu@quicinc.com>
 <369512e2-f091-4370-bce5-9ac32178dc4d@penguintechs.org>
 <a6ae69ad-b602-4cfc-9f76-8932f357d30b@kernel.org>
 <c0f7036d-c129-400b-85a2-1414ec3d2622@quicinc.com>
 <dc17aea1-9399-4c2b-8775-fa0a7f602035@penguintechs.org>
 <CACMJSevocRot6J06uvridRw9MZFftJrkCyYBgXhLnwfapVPnCw@mail.gmail.com>
Content-Language: en-US
From: Wren Turkal <wt@penguintechs.org>
In-Reply-To: <CACMJSevocRot6J06uvridRw9MZFftJrkCyYBgXhLnwfapVPnCw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/22/24 1:51 AM, Bartosz Golaszewski wrote:
> On Mon, 22 Apr 2024 at 07:21, Wren Turkal <wt@penguintechs.org> wrote:
>>
>> As the user who originally reported thes issue, I can confirm this. I
>> was introduced to this regression because I use Fedora Rawhide on my
>> laptop, which builds and pushes kernels based on mainline very regularly.
>>
> 
> I don't doubt my patch could have caused a regression.
> 
>> Here is my description of the regression: After the reverted change, the
>> BT hardware in my laptop (qca6390) will only work after a cold boot when
>> the hardware has only be enabled once by the driver. Once the hardware
>> is enabled, the process of disabling/re-enabling fails. Also, the
>> hardware cannot be enabled after a warm boot of the laptop.
>>
>> Among other things, this makes logging into KDE Plasma break my
>> bluetooth mouse. The cause of this breakage appears to be that Plasma
>> disables/re-enables bluetooth hardware upon login.
>>
>> GNOME operates slightly less badly in that bluetooth stays enabled.
>> However, if I manually disable the bluetooth via the ui or by restarting
>> the bluetooth service with systemctl, the mouse fails in the same way as
>> happens with Plasma.
>>
>> Once the bluetooth has failed, the only way to fix is a cold boot and
>> only enable the hardware once. I cannot remove the modules (btqca,
>> hci_uart, and bluetooth) and re-modprobe them to fix it. I can't restart
>> the bluetooth service. I can't do both of those things. I haven't found
>> any way to re-enable the hardware beyond cold boot with bluetooth
>> service enabled.
>>
>> If I disable the bluetooth service and cold boot the laptop, there also
>> appears to be some kind of race condition as not enabling bluetooth
>> service very soon after loading the hci_uart and btqca modules during
>> boot puts the system in a state where I can never enable bluetooth. I do
>> not know what causes this specifically, but my theory is that not
>> starting the bluetooth service immediately puts the driver in a similar
>> state as when the service is started immediately. Maybe some kind of
>> lazy initialization that is forced to happen more quickly when the
>> bluetooth service is enabled?
>>
>> Any way, this reversion by itself (which I manually did after a
>> discussion with Zijun before getting his test patches applying to my
>> kernel for test). However, this reversion did not get the hardware
>> working after a warm boot.
>>
> 
> This all sounds plausible. However just reverting this patch is a
> waste of time as checking IS_ERR_OR_NULL() on the return value of
> gpiod_get_optional() and continuing on error is wrong as I explained
> several times under Ziju's emails already. I provided a suggestion:
> bail out on error returned from gpiod_get_optional() even if the
> driver could technically continue in some cases. I don't want to have
> to argue this anymore.

I'm not trying to argue. I am trying to find a path forward as a 
concerned user. I am also trying to figure out if there is any way I can 
help resolve this. I am not a kernel developer, but I would really like 
to contribute in some way, if possible.

> 
> Bart

-- 
You're more amazing than you think!
