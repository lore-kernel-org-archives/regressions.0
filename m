Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E5F2100
	for <regressions@lists.linux.dev>; Mon,  4 Sep 2023 11:11:29 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68a402c1fcdso707635b3a.1
        for <regressions@lists.linux.dev>; Mon, 04 Sep 2023 04:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693825889; x=1694430689; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VfLBqtqsKewVLZ7LDcXD0Gsn2qEn+ss4iL3ZMurcTxk=;
        b=fYNDFNwDMpHzV0IszGsmm5rOsjLbcTNrIA7y1UVt8CLMKVrXBEuQ7Ktofc4dUYlUJJ
         E255lhuV9AbrvtukLXHtTRqzuyOtOEs06S4DE+fUXoa2btPi+dXBaqduJRb+8NKyASAa
         Zfa6Qx5GhV1RdCGZH8idMUF29I43BHPJnvOp01bzUDIAW/yerFPXHXwz4rr2UPo/gvyA
         /IbUVKLTd5S4K6K03no3B3K3pHKoapib0O4mEcyel9c87rQw1Ao284XvADH0u+bNWhcO
         t6wTsTcC3CdzI/rcYjnvjf+ruznEQdncYXwLx7T69n7+aVgxlf8THMfjmhiZbUQsfbAB
         DOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693825889; x=1694430689;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VfLBqtqsKewVLZ7LDcXD0Gsn2qEn+ss4iL3ZMurcTxk=;
        b=XbQyxO6aFHPEF+4rhFjlh71H65H1ztFhpM1/NQAs3sWtd8SQEIJiEd3pmyfBwuRYdC
         iY3HTJtNjAvUWNahiOuRItfO6FUnZpPN+psRUC2wfQ6pFyK35Mncl6C7jVKvodPeRLSA
         JzDCpMGDUODRwYgyBsxeeSNF2kvHYRPolfuiYG2IUZilamwIG0euv/G/QODcJuogLefa
         EwLuim4AgeHiD2qAIlkRyUcprYzNTB/6/Cx0R8oDhz+DKrEh6hJHIIFIuv+DJshMqvEU
         StoifCc384YLUmuMkS2Togn+3BXeFKZMq2MjUfJQf81nkHqS/a4gBAAsjbIKrxtXqhc7
         6ucQ==
X-Gm-Message-State: AOJu0Yy5/JJeHEGS0mmaLmD4xZGtbPBOAySUC9FIyG0BemQh1tTqq5qf
	kdvj3ldcx74sp8G6cmA3wwo=
X-Google-Smtp-Source: AGHT+IGhVcxbTJAKxk/tRr/+FBgRNMp49OEhYj+pugMQgSKYjV7TBH7c1h9wwQ0MwzKbY+MoacCkow==
X-Received: by 2002:a05:6a00:1587:b0:68c:4ff1:3dfb with SMTP id u7-20020a056a00158700b0068c4ff13dfbmr10008646pfk.8.1693825888906;
        Mon, 04 Sep 2023 04:11:28 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id x26-20020aa784da000000b0064d57ecaa1dsm7155897pfn.28.2023.09.04.04.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 04:11:28 -0700 (PDT)
Message-ID: <79b1e941-b0a1-1b69-0f2e-38f2949ed37a@gmail.com>
Date: Mon, 4 Sep 2023 18:11:22 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: Fwd: Kernel version 6.1.50 regression: radeonfb deactivate vga
 console
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Helge Deller <deller@gmx.de>, Alexei Gradinari <alex2grad@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Framebuffer <linux-fbdev@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
References: <f8c26878-aabc-7cc9-59a1-3f68bf1d43c1@gmail.com>
In-Reply-To: <f8c26878-aabc-7cc9-59a1-3f68bf1d43c1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/09/2023 07:01, Bagas Sanjaya wrote:
> #regzbot introduced: 9b539c4d1b921b https://bugzilla.kernel.org/show_bug.cgi?id=217861
> #regzbot title: using pci aperture helpers deactivates AMD ES1000 VGA controller
> 

#regzbot inconclusive: now tracked on gitlab.freedesktop.org tracker
#regzbot link: https://gitlab.freedesktop.org/drm/amd/-/issues/2826

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

