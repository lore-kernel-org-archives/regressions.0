Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBB23207
	for <regressions@lists.linux.dev>; Wed, 11 May 2022 20:24:59 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id i17so2938361pla.10
        for <regressions@lists.linux.dev>; Wed, 11 May 2022 13:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7DHaehMDrh+03QkM5bqozyiHYpbroPhOjibyo1d3f6c=;
        b=dvgBF7ZyO/9FAMpMHJWydksAMiUwTsq3BJsWkuahaTHwQna24VsNFBREJJ4dgguD8X
         L+7B7KkTZyN7Y9C/Ov4d6yd59jeHfNFB9B+ufRP6dibTDzBDfFBOq+IYro6uck6UISGD
         x9WzYQaxQpm7IxEZh7RSM1Tp36k2ibSyx8C6rNWNeTWecX1DJzssi+MNC9EDd6iKw16a
         ylVCcONKMzEZ+x+jAz2B2qlcTGHNR5GJyBQ93dNaJM9bK9Udoiuil/ASR+pTwH1ENgze
         AN3U4362aG3HGjEyt4rv45361EyZ/7ZYIPYtI4NQDpKQIjdXjC3KtLr0KbH4kQvKZLgE
         o7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7DHaehMDrh+03QkM5bqozyiHYpbroPhOjibyo1d3f6c=;
        b=Z3grCxXwn4gIxC4uBIphCjZpHBr3Y5D6Q/zu8kmyi1FEcORvj9y6NNq55cjM6UGv2t
         uzUDjiwOfEeYAEKTcaSBb8xqV19Im24g94c22R9b7i15h4OIf2CDVuazK4JGT1C+ptWL
         1dWl0hP7XThKP2YGvp8YwCdFQthl3e2oTReYmj77pqxvVRhdjn/MjpiHXacIj/hIux5V
         svSeWtNvtqnXUZ0fgLhhmT19xBM+TQN1bzIgToN8vERV/L6hKQlLychBbGgjHiIn5jeH
         IuGYadfBeaNFw1ZNxTGpaJKdA0PqXlqjtvpvRnHzHUTD+PFCLl7uvxNV8xUhkQJZ0vDH
         wbog==
X-Gm-Message-State: AOAM533F7Lxc1UhkP/uWP2AwARFzXLM06Xc+RY9FSQ86C5Ygu3Rcq2OX
	1sgdEDtd7O49O8f/oXxrRZA=
X-Google-Smtp-Source: ABdhPJzEF6Skn5sgMrWIE7eSe9jrqlrgN4p0n+NkZxLiTL7kjAtQbXjDrBpKFgt5681tfU1mFbieHQ==
X-Received: by 2002:a17:90a:7f94:b0:1cb:1853:da1b with SMTP id m20-20020a17090a7f9400b001cb1853da1bmr7095881pjl.14.1652300698522;
        Wed, 11 May 2022 13:24:58 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id u11-20020a17090341cb00b0015ee60ef65bsm2340389ple.260.2022.05.11.13.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 13:24:57 -0700 (PDT)
Message-ID: <f9be7d36-d670-ef6c-8877-5b38e828e97f@gmail.com>
Date: Wed, 11 May 2022 13:24:55 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 0/4] PCI: brcmstb: Revert subdevice regulator stuff
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, Jim Quinlan <jim2101024@gmail.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, Nicolas Saenz Julienne
 <nsaenz@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-pci@vger.kernel.org, regressions@lists.linux.dev,
 Bjorn Helgaas <bhelgaas@google.com>
References: <20220511201856.808690-1-helgaas@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220511201856.808690-1-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/11/22 13:18, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Cyril reported that 830aa6f29f07 ("PCI: brcmstb: Split brcm_pcie_setup()
> into two funcs"), which appeared in v5.17-rc1, broke booting on the
> Raspberry Pi Compute Module 4.  Revert 830aa6f29f07 and subsequent patches
> for now.

How about we get a chance to fix this? Where, when and how was this even 
reported?
-- 
Florian
