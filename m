Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBED8472
	for <regressions@lists.linux.dev>; Sun, 22 Dec 2024 07:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734853053; cv=none; b=BjkWmFxbyfUSz8yKtsYhgYykkszk/Qra0Jkqh0LvEp14CV2oWuYOduxYX31NJ/DhHjRKO7OtEVhVt5XBaPW20xG4/xK0+n1hbOq37SdEBaKATinFwWxVpy1/n7LwbxOvIhG77HINDExNyOb66b7YhjkRRyUnY939JdWJ876eR6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734853053; c=relaxed/simple;
	bh=NAx7BuxW2v7682O6csvhRPUArYnTbC4ZgJ9DLa94yNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e0b/S2SIGPjEc+7/ZYsuaQKexyfxg7MJ65mRjMrVZyV/Bn/K/JS7K31Nfs/TmKnME8hy/duX7D63JgY+iOYo+seGDXU2LXRYFia/cEhOIz3e3PVQsjwCUqk48el7dmCdvI/fpIKjOAoauAW6dlsL1Wf9V/11utVVlh6I6SYtMRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnGZImMB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnGZImMB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361f664af5so36371025e9.1
        for <regressions@lists.linux.dev>; Sat, 21 Dec 2024 23:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734853050; x=1735457850; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0nPbiq3g+dxfCRMYLQbYZmL3rmBrcEtirj2UUfzdEIU=;
        b=dnGZImMBmkzpTc/qgew8/mAHJd8JGQ+q57VW5NKPLA7tOE7Gquq13HX1datPspntjq
         PxKhYLiRRqA/uQW7OD/OlWXCW6lpm4urTAmORlTZZ7mcqn50GJFkp3HGuGIb4QXdhvWi
         RtP6tu8I6+Caw34ose7iGjF+kFWbk37O2lAj/CzubwKqdcr5/BVM6P/68Ad/r7ctKbNH
         3+JqPLW5yuDvRYs376SOPkLlU3GF3/fFtFXE4HXnm3jspzFulxAh1OVt21qmsThTOGTe
         hoGq9HhAu9PfyUlcJCW1DlFU7jddtvnjInHsbJ7rCdrBg0QlaZ3Z4jtxoUZbaITFIRzS
         3oxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734853050; x=1735457850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0nPbiq3g+dxfCRMYLQbYZmL3rmBrcEtirj2UUfzdEIU=;
        b=dOOucJNXuD+5RHJjhLTXsfSwgriMCQdtDJKmiFAhxj8BBFwrSpE9mTXOH4ErG1LSO4
         xBFo1rUqEla7U/FyN4g8rNJ0MDVdk/PDPXGvqduJSPCE8YJqocY+LDeaj2ZMSd5BJ6oO
         S7N/TwLIFM2OtB/IpTpRI7E7zrF+E4eoN7wbfyzw1q7/zxXMaE6VH4so7JTjegDxZu++
         zA28D7ItpdECDpPXN2j6ytwnO/Mrm9ioWaJHXstCgLg00THl/ozDwrnOg41Az8KIXzoe
         OiBZF0Ggs2phRQn+FyyrK93ACTXL00NyUjZ45ut0KwdECPh+FcNI9MnCydI/XDvO3v61
         NBmg==
X-Forwarded-Encrypted: i=1; AJvYcCXGmMKKu9AIAIHEKYSknC88BBaSQhKdR68II8C/WHB8RvSMGraQMX/NyRWtanuGhfo6S57/KwQg9TIlNg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSIReDk8iYtW8cIhHTM3Lo+/UDcoNDsqJsFhZU7PU+cYVptxj/
	e6Vlq1x5QSHrs8svQrNJf146eo1iGC1xKST+atY6+5VK2gnaiIKt
X-Gm-Gg: ASbGncsisJeu2zijllnLb8pGR7ji/4XtiIGqbMdZx6XcdxrrQM/Rkgn+uMo/BKCqSU7
	fTS+Tqixz6AH3OdTOkIjP21BwJFk+3MU0MbAzOUfQvIiJsBMWbPpsG2UIO2fVwj73AR/pInsWit
	+RKGRVLCZTku8sx9qwe0wLfExJ7xZ/JU3SFYnvlbjnykRLy6xFjySj2T7bM1CYT3Li0MCE+gWoU
	nTP6pIaUfXDgDVfHbxpTpPc9qz6tUDaC5aKeGLb9rTdMW6TE4Vo4HH45J7wvU7ubpcVadHQ8b7j
	NESsbPJH4/dcipEpOh5Zip+mBW+NnAO0XOYv3w==
X-Google-Smtp-Source: AGHT+IFSGdhCog6uSXLpFm+pr0vXhNpzT4F4SrM1oT802P5T6FT4W7Nfz8TaBX8F+8odOeywNFNKxQ==
X-Received: by 2002:a05:600c:3b13:b0:435:23c:e23e with SMTP id 5b1f17b1804b1-4366864409amr79132085e9.12.1734853049981;
        Sat, 21 Dec 2024 23:37:29 -0800 (PST)
Received: from ?IPV6:2a0d:6fc2:56d6:3b00:20f3:5417:1c06:8272? ([2a0d:6fc2:56d6:3b00:20f3:5417:1c06:8272])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8474a9sm8148343f8f.52.2024.12.21.23.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 23:37:28 -0800 (PST)
Message-ID: <57883f2e-49cd-4aa4-9879-7dcdf7fec6df@gmail.com>
Date: Sun, 22 Dec 2024 09:37:27 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Distorted sound on Acer Aspire A115-31 laptop
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux Sound Mailing List <linux-sound@vger.kernel.org>,
 Kailang Yang <kailang@realtek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions Mailing List <regressions@lists.linux.dev>,
 Linux Stable Mailing List <stable@vger.kernel.org>
References: <e142749b-7714-4733-9452-918fbe328c8f@gmail.com>
 <8734ijwru5.wl-tiwai@suse.de>
Content-Language: en-US
From: Evgeny Kapun <abacabadabacaba@gmail.com>
In-Reply-To: <8734ijwru5.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/24 18:38, Takashi Iwai wrote:
> Could you give alsa-info.sh output with broken and working (reverted)
> states?  Run the script with --no-upload option and attach the
> outputs.

Hi,

I already posted alsa-info output in a previous message:

Broken, kernel version 6.12.5: 
https://lore.kernel.org/linux-sound/0625722b-5404-406a-b571-ff79693fe980@gmail.com/3-alsa-info-6.12.5.txt
Working, kernel version 6.7.11: 
https://lore.kernel.org/linux-sound/0625722b-5404-406a-b571-ff79693fe980@gmail.com/2-alsa-info-6.7.11.txt

Or do you need alsa-info with a new kernel, but with the offending 
commit reverted?
