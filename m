Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8743C1102
	for <regressions@lists.linux.dev>; Sat, 13 May 2023 09:48:25 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-643aad3bc41so10136485b3a.0
        for <regressions@lists.linux.dev>; Sat, 13 May 2023 02:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683971305; x=1686563305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3QfA5JCbN8OCiQT2s4BkmQZvf/DQ8KNSZSDVsW/zQ1M=;
        b=RYDkfZ4/QQEKJ1CfJgUqgjSjGcOjSsEV7WHMGqR6E7FHtMtXAmbOrHZJQTb9Jtu6q7
         Qf2scV15CONKLVQKtKMCTYpQ/R7frjt4FWoLfKRMq3MQIxaHQidn9H9Beh/kv4x6UInl
         sR5eV9BnU7E7fARS4EnCjmkTtRgpMnpmE2YNz4CK3/vovfPcYx34JV5ZSMKo/9WHol3m
         FkLDYD+mq4wnoEDQysWl97iTEuiT2NbJuAfBNiq+OSE2kt2jTKFIKVzxrPr5ghkAhK+1
         HdSe+FfumQwf4HCilsT5Oy31RQIN8ZsQGVOAxh91MgeRswjuQCaPntFLkITyMdv1WUBB
         hehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683971305; x=1686563305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QfA5JCbN8OCiQT2s4BkmQZvf/DQ8KNSZSDVsW/zQ1M=;
        b=P2Jzp6uKgjoZgNUuskx8XQFJW56cF9ApHVMWus1XmWxGw9XlcQXQydbh9etFGW2Ry1
         Xr4cnvPUgl9DCFDKS9guLYJc6Ad4faTNeUxkLMDr6PtfBqNaQE5D8KGY77DL4h3TY39+
         O5X9tx3zhnpmYjJfuCBHxQjOg6+SbEhABVFlrnSCahdcPmM9Y8JPdrnixKAZ5ImDHIde
         oTySu5xtuN265esBM7aMFZyPbu0SLF0N1dP82/qZTJmEn4u17vqyI4lO+SIdAcqUhhkr
         +ba9xFUcIKRDTLBRcJjc6TUERsNu1OPCVc60rybspjYqv7bkFmoKPSmYrjNM/YfJvyIg
         Xq1A==
X-Gm-Message-State: AC+VfDzXOAuuUcGom/4XCUEqzA2MxMX5Gr5EBjQMb5HNQG5Uu5nroRzG
	HwV6G9+oNnD1sXSVZmU4TkzncV3RUM8=
X-Google-Smtp-Source: ACHHUZ5SDwB48Eoj8AoI0Db2AOMxxmBcBoNVVeW0ZQuX1Z5z4Cr/VbBTea7kRFu7Of3IFQbCldXyvQ==
X-Received: by 2002:a17:902:ee8a:b0:1ac:6c26:c32f with SMTP id a10-20020a170902ee8a00b001ac6c26c32fmr23035913pld.46.1683971304826;
        Sat, 13 May 2023 02:48:24 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-69.three.co.id. [180.214.232.69])
        by smtp.gmail.com with ESMTPSA id a14-20020a170902ecce00b001ab016e7916sm27256plh.234.2023.05.13.02.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 02:48:24 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 48A381068C5; Sat, 13 May 2023 16:48:21 +0700 (WIB)
Date: Sat, 13 May 2023 16:48:20 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Francesco Dolcini <francesco@dolcini.it>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: USB gadget regression on v6.4-rc1 and v6.1.28
Message-ID: <ZF9c5AdK2NZ0oa8H@debian.me>
References: <ZF4BvgsOyoKxdPFF@francesco-nb.int.toradex.com>
 <ZF4bMptC3Lf2Hnee@gerhold.net>
 <ZF4kBJEKDy5T39sj@francesco-nb.int.toradex.com>
 <ZF4lqka+PxjHAlrh@francesco-nb.int.toradex.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZF4lqka+PxjHAlrh@francesco-nb.int.toradex.com>

On Fri, May 12, 2023 at 01:40:26PM +0200, Francesco Dolcini wrote:
> #regzbot introduced: 0db213ea8eed
> #regzbot introduced: v6.4-rc1
> #regzbot introduced: v6.1.28
> #regzbot title: USB gadget hangs forever
> 

dupping...

#regzbot dup-of: https://lore.kernel.org/all/ZF4BvgsOyoKxdPFF@francesco-nb.int.toradex.com/

-- 
An old man doll... just what I always wanted! - Clara
