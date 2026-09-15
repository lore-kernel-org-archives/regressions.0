Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058FF47F777
	for <regressions@lists.linux.dev>; Tue, 15 Sep 2026 10:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468005; cv=none; b=UjU7KBO9US5A07T5j+Khky7vzqFIVZcO3wTqTv7DPyoPhCkUjkAxHyuJMl7dYTK3MioJhPTc0rHaKCJFwqzW8C3B8zxKri7X+lanYYfp/r5mA4e3wsmu+7BV4LilUWdJM5GIRskRrpdIHh+0/d0aENQ4jx2EnuKMjCUTZRmiUHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468005; c=relaxed/simple;
	bh=zaYufR9QlUv7eYaLQ+at5yvHX5e6ve5UNDk2t2c25Zo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YPX4gN2jQQSNJMC9Rozp94vkv+fMfcLxRH3X4ahwvXIQdyCV92rDl91V1jutNMRY0IYXNIh8O3CZ0SstuizSMMIm4TBnoHpebwoQbAG4qhFUXPg+Oe0AXCpZYsGlcph5B2IRjgiyy7zaDLYwRgj/hgN4xKygn9RbE8rpqHtuaZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=amVNPvxk; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="amVNPvxk"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so1708581f8f.3
        for <regressions@lists.linux.dev>; Tue, 15 Sep 2026 03:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789468001; x=1790072801; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f86HyW2q5YFv3zSNeYSruMbybkqwMyCIyR1SdKDqPuk=;
        b=amVNPvxk7zRZLxlH/uX0tsGYsS9b4598UJXtte1F25U/c2s1lnlM1qc/XWm12UMr4Q
         OXP4JZZE6S+JdOhMHojKLthiLggURDUbJv4d835EdUQFTZVm49Icl6CLngrGnCiGRM21
         sPyi6I5El6iwD7RU6qrtpDp2VBS1ECmpdFVQ15O48CacaqOUNJgM1xzBAcqnVVEK/gu4
         j9k7jP4dAIHtM3F7qYrMjTmev8NOj6AJxNOVR/XpSyyKeRv+Y4utMPy79LZUIL//1GJT
         B4OE/y9/qq1i0kyp0FYvfVEMrL0RtKcs8q+OJI/I9B0ryyIvgm1FeMSL6PHMXyTaUVfi
         zbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468001; x=1790072801;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f86HyW2q5YFv3zSNeYSruMbybkqwMyCIyR1SdKDqPuk=;
        b=JvYZqq+6C2iZ8M8tjnZJR4/HAkqyrMVST8nE987SOWNs3GDt55ERY0Lat39dHBhn5A
         FUjYW2sVcocRAy5m83CKIMg8Zo6BkjNIGjyjt0IIJ0Wo0TelyG22AreuxxbieCr+eLkP
         6hoRcVlz5u1LRcwKhWZVwx0uaOoO/vDTxzIo0lOJjnF6oXkKSFOajFPSUxSTqcGs+g2D
         LHh4qgof4HGjXb1n2ZsbZwIkC0rKqDsCbimjMUBzu1TZy5yuGZD4JYY1uJdBqTjGnNYf
         xFJAMERC/uFFLLQXNbacvZr6vBTklZZAttwNqK0yOgOMAuQ6FRAVdvjSmGeBdD+WFOFV
         4wLg==
X-Forwarded-Encrypted: i=1; AKwUvBxQbb/XS824pK3JfWY/jWCloGVHwsqVHbVznDKtl5rLLwkoYiHG1t0ENdsTuH9K72kOFqCr40aUEI7w5g==@lists.linux.dev
X-Gm-Message-State: AFuF++mRv4/AZTbMNSYI9yTvTXaUUtotVlFUEIikzpShGaTQCHQrb+z2
	gTxXZPBAwPvK9YwdO42ffBc6md7J0TkFMZU0zk72xn8aAaMowJlXS2qSNfX9F5S6mAk=
X-Gm-Gg: AYBFou0gTHh7LSHnSEYoACKxSOnJHlWdRORo6tkgKgYFZOBhdAwSKyO8ktv5uRi75k/
	vKXNzSL/Ti/i0V2LPeNG4yETN1VYb+7GbwI/noOdAnlRAw376+TuSuj4KA1NWUx0k911bBC9k2T
	3CKgHR3GonVwbpajB95uPocLPJ3mFcDbqnJjHIOy2xE1NMHLUXIdCcSzWfCIB9U9vh2Npd2S6bp
	vNzcfUcNgdBySam1jd98QYTMwZffzDQfmKuDji7gCkcqkO14PnjQ+UVXVuTaDoD9CQLztW82feQ
	EyXf93RiMxa0JNnJSRLCFMu2ZCqJUI1TM4ojsoFYalryec1NeIxHQuZMcISleLi2N2k28BiREw1
	yqzOjQU0wXeT+kN7Sc1qi1rw5Xpk1d2kWrv9yD5/g5Pz4QllSKvwMLrcaHPbou4iKjbFuT3VTw6
	5gB3gFjS3+/CJUWnvmzGkQwTjgi+VZUwg1zJsahB3KZIecFkrLX2SwBE6Q4tRZ3P84xKs=
X-Received: by 2002:a05:6000:41c3:b0:484:3310:710c with SMTP id ffacd0b85a97d-48702b30ad7mr16669938f8f.24.1789468001189;
        Tue, 15 Sep 2026 03:26:41 -0700 (PDT)
Received: from localhost ([82.145.119.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e4b5sm33243901f8f.22.2026.09.15.03.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:26:40 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 15 Sep 2026 12:30:17 +0200
To: Angel J <iamanaws@httpd.dev>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
	"helgaas@kernel.org" <helgaas@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"florian.fainelli@broadcom.com" <florian.fainelli@broadcom.com>
Subject: Re: [REGRESSION] PCI: Dynamic OF node creation hangs on invalid
 bridge configuration
Message-ID: <aqkeOfsmjJlfTGmn@apocalypse>
References: <GXe6anuewkS4bLNwca3cYOmUxN9csc0TxLYGSBc1qNRmfrmvFlcmD62wEM23TxfzfuXAv4P3yvUv7pyraleARrL1Na-aN8w-t9uc1Igu8DA=@httpd.dev>
 <cFJoUZ6c5g5YbFCrwUnx6RlitHRl-0cS2fadDSFJNf9SgLreKutrmZj1r56hFh8ZUAbzvuCqBG4w9ZYAE8xAWP9HnLwbjMOBzac-iMnMMZc=@httpd.dev>
 <aqfgUUkZYZg6ZABF@apocalypse>
 <B6jXhRRiVu4TfgjwfVOLgxbh1xIciImKFVMmjkMRoDt5SO7WpM2M3gBqsjtnh3VhYobWdcNfqFrmlCdhqZBqUakSNkTeVNZYJnXLTx55kRI=@httpd.dev>
 <VaPKN3QbW3sGj8wePAvI_xD3twp_MQE4-4xeSbvgoQPVUnKDWKz0EWT_JiLehpmc6WOsCAoFOPs412Xhtthes_ZtvrgsKB4QB6QPz-XvRb4=@httpd.dev>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VaPKN3QbW3sGj8wePAvI_xD3twp_MQE4-4xeSbvgoQPVUnKDWKz0EWT_JiLehpmc6WOsCAoFOPs412Xhtthes_ZtvrgsKB4QB6QPz-XvRb4=@httpd.dev>

Hi Angel,

On 23:28 Mon 14 Sep     , Angel J wrote:
> Ok, here it is...
> 
> I tested this quirk on Linux 6.18.44 with CONFIG_PCI_DYNAMIC_OF_NODES=y,
> and it boots without either OF fix. The diff below omits the test logging.
> 
> PCI_FIXUP_HEADER runs after the resources have been parsed using the
> original header type, and changing hdr_type also affects configuration
> restore. I don't know enough about this part of PCI to judge whether
> that's safe, so I'll wait for your advice before submitting it as a patch.

Thanks you for your submission!

LGTM. Maybe you can play, if you don't already, with pci=realloc,assign-busses
kernel cmdline options and writing in remove/rescan under /sys/bus/pci/*
(watch out: this could kill your system). But better to ask for opinions
from PCI experts.

Thanks,
Andrea

> 
> Thanks,
> Angel J
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index de9bbccda..57df88a38 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -291,6 +291,22 @@ static int __init pci_apply_final_quirks(void)
>  }
>  fs_initcall_sync(pci_apply_final_quirks);
>  
> 
> +/*
> + * On the Dell XPS 8940, 8086:4c43 reports a PCI-to-PCI bridge but has no
> + * downstream bus. Use host-bridge class and a normal header so that
> + * pci_is_bridge() does not send it through bridge scanning.
> + */
> +static void quirk_intel_4c43_host_bridge(struct pci_dev *dev)
> +{
> +	if ((dev->class >> 8) != PCI_CLASS_BRIDGE_PCI ||
> +	    dev->hdr_type != PCI_HEADER_TYPE_BRIDGE)
> +		return;
> +
> +	dev->class = (PCI_CLASS_BRIDGE_HOST << 8) | (dev->class & 0xff);
> +	dev->hdr_type = PCI_HEADER_TYPE_NORMAL;
> +}
> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x4c43, quirk_intel_4c43_host_bridge);
> +
>  /*
>   * Decoding should be disabled for a PCI device during BAR sizing to avoid
>   * conflict. But doing so may cause problems on host bridge and perhaps other



