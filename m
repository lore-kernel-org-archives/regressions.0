Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9A817BB5
	for <regressions@lists.linux.dev>; Tue, 21 May 2024 16:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716307361; cv=none; b=dlBghVPGDt8haEui3qusTJAi481rtm7LGZwM569ofuHcwYPL5qPy2Tifl/djlMDEiRIKxgYFMJwhtJDmqOhFPCKPfvtBXmLsdkgFaGAsSSEh8fg4ClGO53Y+AzebiSGJfsiagQnDrzG9D4zz0P0RE4l9glxLL/kS4n7qDQveYIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716307361; c=relaxed/simple;
	bh=LvQkK1x6wKDbqniMQIsTNsYXVp9z4lc1HTvxzlRvhOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cj+/YP/RflCrjFBHYv6RQg0P7xc7yW8OHIdjWZPHWdOj0gn/db7JtevBs7qMdYUI89BJ9HsoXReTJrXxqPMbbklqez4nBC04T7ugyn6HLnl77ReNUlP89xUdwTeAm4yaL60EMLscuye5XUZuCHlORVK9VAkYhbOkssIDaCPh0wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qk3l+R9k; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qk3l+R9k"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-351b683f2d8so3233179f8f.3
        for <regressions@lists.linux.dev>; Tue, 21 May 2024 09:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716307358; x=1716912158; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CwLrAnoDcKfl4pASlzPf6/g0NwpfS2Ef+d5jWtjl7A0=;
        b=qk3l+R9kzy+Qb1mzW1p3+3yeS1n04El8M4xKF/6JO3TN9iEz+oGoYRua4Fdjy+aK0w
         qSOf014mmpF5KvAY/tkW6sITkY319OElrPI1AcsJivBzr9Gwvwld/liq4S1XsdsEbDfO
         be/I+M9Y/jsRX4Q9t6EMXZtg5gP5AMa8m9v0MpEcNeLvSYSyZko1UdpJlY57r+DNFN+W
         PeLI5EciQKGgWMBBphq/QkP8YVjczeh3qO5xE82pDZyzyrrw1Pz98ZkFaDRTSqs+Mz9y
         rFnWtCtYnPP00PcgdCdZ5mIpfk1avPSEJbDcLvu6ZGf0O/fD5kt5/GsE9B9S/tVL5gDt
         /IAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716307358; x=1716912158;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CwLrAnoDcKfl4pASlzPf6/g0NwpfS2Ef+d5jWtjl7A0=;
        b=BvJGVuZ6AwOxiw7n4HtQ4/kr4fMnxT8j3qWFu89TytzI1TbX7ngLl3RHVXJRXyjiCD
         fjaexPjNyB0d7XGQMxPwbO8NTKHZkEtl2Ket3VDPnT5ydOPJiXHjQh7+rmIYNnEvOml4
         emw/wSDyXog5rMTdpSObp3bJZPlyulr9h84EpmhMWAoYjEbGMo5ONTyEhwU+xPjvp5dH
         jUIYfoby6U7WBbk4EhhguGT+tf9vheH9SVpEe2XJiq7PGieId6eRa6sF66eL/RjWfaQC
         OLPFXrtHeg3Rbb94hjkBtgB7ip6Z/7iLxV7m92hVTyzB0QmzBFF2nD31ub5umEdXARwT
         2dlg==
X-Forwarded-Encrypted: i=1; AJvYcCXGV8w8pSl+ZFioscP63tPbhUx/djKeQUWhZeg8W3dERcAUw5p1HdnJJEPkAN5kl3EJQtZe+ep3+TspUm2/cb7+BCSuoPaSMYrTaAM=
X-Gm-Message-State: AOJu0YwsAuWBGrIVSEC//l2KaMZVoxcGYdbYMQACVxf6Mk4kUX9ctIvZ
	8v8rzCYDdcsoheBakLQRwly1MTCKU1/dhGshwm0kF020hOfb1Ouvl2AzOl9SFb4=
X-Google-Smtp-Source: AGHT+IFWv2DibPTZdRxMs8ItKbWP+f7I+Zrb3KKf4jtBV49zvoSqvL8D0wlAMMaY6rsZbNEw+9hBRA==
X-Received: by 2002:a5d:6044:0:b0:34c:5448:b81a with SMTP id ffacd0b85a97d-3504a96a820mr25830846f8f.48.1716307358313;
        Tue, 21 May 2024 09:02:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baacfb9sm32096026f8f.68.2024.05.21.09.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 09:02:37 -0700 (PDT)
Message-ID: <7927abbe-3395-4a53-9eed-7b4204d57df5@linaro.org>
Date: Tue, 21 May 2024 18:02:35 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Bluetooth: qca: Fix BT enable failure again for
 QCA6390 after warm reboot
To: Zijun Hu <quic_zijuhu@quicinc.com>, luiz.dentz@gmail.com,
 luiz.von.dentz@intel.com, marcel@holtmann.org
Cc: linux-bluetooth@vger.kernel.org, wt@penguintechs.org,
 regressions@lists.linux.dev, pmenzel@molgen.mpg.de, lk_sii@163.com,
 stable@vger.kernel.org
References: <1715866294-1549-1-git-send-email-quic_zijuhu@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <1715866294-1549-1-git-send-email-quic_zijuhu@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/05/2024 15:31, Zijun Hu wrote:
> Commit 272970be3dab ("Bluetooth: hci_qca: Fix driver shutdown on closed
> serdev") will cause below regression issue:
> 
> BT can't be enabled after below steps:
> cold boot -> enable BT -> disable BT -> warm reboot -> BT enable failure
> if property enable-gpios is not configured within DT|ACPI for QCA6390.
> 
> The commit is to fix a use-after-free issue within qca_serdev_shutdown()
> by adding condition to avoid the serdev is flushed or wrote after closed
> but also introduces this regression issue regarding above steps since the
> VSC is not sent to reset controller during warm reboot.
> 
> Fixed by sending the VSC to reset controller within qca_serdev_shutdown()
> once BT was ever enabled, and the use-after-free issue is also fixed by
> this change since the serdev is still opened before it is flushed or wrote.
> 
> Verified by the reported machine Dell XPS 13 9310 laptop over below two
> kernel commits:

I don't understand how does it solve my question. I asked you: on which
hardware did you, not the reporter, test?

> commit e00fc2700a3f ("Bluetooth: btusb: Fix triggering coredump
> implementation for QCA") of bluetooth-next tree.
> commit b23d98d46d28 ("Bluetooth: btusb: Fix triggering coredump
> implementation for QCA") of linus mainline tree.

? Same commit with different hashes? No, it looks like you are working
on some downstream tree with cherry picks.

No, test it on mainline and answer finally, after *five* tries, which
kernel and which hardware did you use for testing this.



Best regards,
Krzysztof

