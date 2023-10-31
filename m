Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837371FDA
	for <regressions@lists.linux.dev>; Tue, 31 Oct 2023 08:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwELK5e5"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5ab53b230f1so3758944a12.3
        for <regressions@lists.linux.dev>; Tue, 31 Oct 2023 01:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698740486; x=1699345286; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59ItUKeKAfQl6Pm0GuI2gI2GpUNLzTXJ8v/99uj7RTc=;
        b=YwELK5e5GsJ0M4z5GmzigqZ2LKWmQnqnpce+/PunOXZlhfDF5zb8u1FctUU/MKKCHi
         HpWtfBXYUPjXN44bg+/2KhYXJTatVAPs/ujuKhRQGZWOSldfgT0i+dMOs4DG/6/Dt9nj
         YPkNqjxtUHm28qP0+OkGKpP9/UMi7Z6rYrCDLQRLZoISsNDjdGi9pLYdyQYX+YZbYfc5
         z3OokOBLvaRfRlvRVpD0egk2aFkpB1YpjxX/iaA3owTXnL6Nh7gNd4F9Y3ZWqM5Nj08j
         WVBSzHXdn1B6+4QNV5lda9qvu9NHLfpQMEQlN76ZICr4QbGMS5yVoHufiMnHrFGqrg8B
         2N7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698740486; x=1699345286;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=59ItUKeKAfQl6Pm0GuI2gI2GpUNLzTXJ8v/99uj7RTc=;
        b=AdOCDOsYmjQX5rnV7Pu4qDrFiCyamnRpmaHDnfsseluAHHSdpyvJaxPl64hwez8DME
         ELTfERH8H3HaVjOVaAYS7MTqnkKKrfFvz71iIjK4j+zGON71YtkhcFXAng8KKYXHRLo/
         Q6JkOzN2FJz6eCS8LAgvT5vusBdZRulc+54DHWYVE/7f+X2wEk2cYB0eG5gW3DBqeg+f
         DDYh5V4F+7LWju50DxxRf77t+gAhv8yZ9CE7NEfOjtcMMTB11/eZpWBWCfDsqJq4610b
         0Z9333vJjIGaxyXtxHY2kPs0mzOZZj3ezFa18pej1gZvXcsiLgCimcrsrG/0yMFyXi7a
         MXnA==
X-Gm-Message-State: AOJu0YzRkWzmWW1e6GlcYObomNCzRHCGq/fzgxjQ/IUYurFfRvT/2b9S
	R2i8DbZholXQpmETuXUJ/qM=
X-Google-Smtp-Source: AGHT+IHHBHVRJNDBt0RAGcu/t+Q6uNYCEvGjtPkxGzeePph6Ndp8DOdzVsRjMIOiIjmUcvhZ8C81LQ==
X-Received: by 2002:a05:6a21:7747:b0:180:f227:57f3 with SMTP id bc7-20020a056a21774700b00180f22757f3mr1149592pzc.60.1698740485779;
        Tue, 31 Oct 2023 01:21:25 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id fi18-20020a056a00399200b0068fb8080939sm733810pfb.65.2023.10.31.01.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 01:21:25 -0700 (PDT)
Message-ID: <0e784280-02bb-4e0e-a5ae-4e0a40ea4c51@gmail.com>
Date: Tue, 31 Oct 2023 15:21:20 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux NVMe <linux-nvme@lists.infradead.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, gloriouseggroll@gmail.com
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Regression: Kernel 6.4 rc1 and higher causes Steam Deck to fail
 to wake from suspend (bisected)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> On Kernel 6.4 rc1 and higher if you put the Steam Deck into suspend then press the power button again it will not wake up. 
> 
> I don't have a clue as to -why- this commit breaks wake from suspend on steam deck, but it does. Bisected to:
> 
> ```
> 1ad11eafc63ac16e667853bee4273879226d2d1b is the first bad commit
> commit 1ad11eafc63ac16e667853bee4273879226d2d1b
> Author: Bjorn Helgaas <bhelgaas@google.com>
> Date:   Tue Mar 7 14:32:43 2023 -0600
> 
>     nvme-pci: drop redundant pci_enable_pcie_error_reporting()
>     
>     pci_enable_pcie_error_reporting() enables the device to send ERR_*
>     Messages.  Since f26e58bf6f54 ("PCI/AER: Enable error reporting when AER is
>     native"), the PCI core does this for all devices during enumeration, so the
>     driver doesn't need to do it itself.
>     
>     Remove the redundant pci_enable_pcie_error_reporting() call from the
>     driver.  Also remove the corresponding pci_disable_pcie_error_reporting()
>     from the driver .remove() path.
>     
>     Note that this only controls ERR_* Messages from the device.  An ERR_*
>     Message may cause the Root Port to generate an interrupt, depending on the
>     AER Root Error Command register managed by the AER service driver.
>     
>     Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
>     Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
>     Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
>  drivers/nvme/host/pci.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> ```
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.4.y&id=1ad11eafc63ac16e667853bee4273879226d2d1b
> 
> Reverting that commit by itself on top of 6.5.9 (stable) allows it to wake from suspend properly.

See Bugzilla for the full thread.

Anyway, I'm adding this regression to regzbot:

#regression introduced: 1ad11eafc63ac1 https://bugzilla.kernel.org/show_bug.cgi?id=218090
#regression title: Steam Deck fails to wake from suspend due to pci_enable_pcie_error_reporting() removal

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218090

-- 
An old man doll... just what I always wanted! - Clara
