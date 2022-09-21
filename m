Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9ED67E3E
	for <regressions@lists.linux.dev>; Wed, 21 Sep 2022 04:44:25 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id c7so4753693pgt.11
        for <regressions@lists.linux.dev>; Tue, 20 Sep 2022 21:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=QvCStQH9wWobodRWutr5mV7TPPRrro8caiAVbbSMeAw=;
        b=M9IoHazJ/8Rc9MI/UxoGN6jKsOSMKrX35y2GS7AqghechlMDFEjsoh1s/lf+GHffGG
         UaBc4NhH61owmUpUxeestiA8RxhGObHEfx2yiSd+YoUTeV/TJKq90ORHobvV67mo3Y3x
         2mUwTHxUiObzLSMGR0lUfDfjapQYbQjI4GUaSmUt1A16poWNCsuW9O1meos3q6Mlp17o
         sZQ86rPyOt2FSoIVVO9bjxCGs/BD/alvJ5a7X3PuQOE4vP5YsnK8A5l5+jlgWu7Vpp9J
         UpkHkXGLUCBbjSEe83weEn089+idev3Ij8hfatBBkMM0nY9QK9vjFW84yppYqr0CFlrD
         CaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=QvCStQH9wWobodRWutr5mV7TPPRrro8caiAVbbSMeAw=;
        b=quE5iofCq8kNXGPFEH8nGmqklrHqkYsUqTqTW2jPw9LVDYl0Od+jwS65dArj+WD8nT
         XcNqA984RFIkMOnAYv/g5kSNylY+5fwPDLOGj5uQOwiPsS9+RM3Szbm7gCcBbKrZ/pZU
         Cnz+chv7arXwRWXFwdRXzql91KryWdlLrrUcVegeoDUvE71pVeVFrUO9FGQZf8bPgUVG
         WQspE58uLsDMNNpVqpIpzgsGtH44zIGGSa1blJMbZ+LW5xBWsvlsJim++p1cOyFT6N5Y
         2jLJqcblfAJbaoO0AerKDx9dp8mixJPIVVkirJBmm6epHocWJfJNtCVpsDkkoeuuWRRJ
         hcfA==
X-Gm-Message-State: ACrzQf1oUpkjTUIKJ3Oj4+rwWX1TcdB3NFkOxQ+A8DVijZCF+m35eJcA
	O7aj6DvowV29Mty5NS2YIb8=
X-Google-Smtp-Source: AMsMyM7XhRL4gXDZPwHm37mPuhOCN3dCuo6MXMRo9ipXtoy/jcC/OZmhnXvBwwsLUo5tYDBrbSy20g==
X-Received: by 2002:a63:86c6:0:b0:43a:bd68:5075 with SMTP id x189-20020a6386c6000000b0043abd685075mr8103197pgd.512.1663735465393;
        Tue, 20 Sep 2022 21:44:25 -0700 (PDT)
Received: from localhost ([2406:7400:63:83c4:dfab:3b6f:2c7f:db86])
        by smtp.gmail.com with ESMTPSA id r2-20020a170902c60200b0016dc2366722sm825262plr.77.2022.09.20.21.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 21:44:24 -0700 (PDT)
Date: Wed, 21 Sep 2022 10:14:19 +0530
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: hazem ahmed mohamed <hazem.ahmed.abuelfotoh@gmail.com>
Cc: "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	"tytso@mit.edu" <tytso@mit.edu>,
	"adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	"Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>
Subject: Re: Ext4: Buffered random writes performance regression with
 dioread_nolock enabled
Message-ID: <20220921044419.epojssm3g4j3qkup@riteshh-domain>
References: <CACX6voDfcTQzQJj=5Q-SLi0in1hXpo=Ri28rX73Og3GTObPBWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACX6voDfcTQzQJj=5Q-SLi0in1hXpo=Ri28rX73Og3GTObPBWA@mail.gmail.com>

On 22/09/19 04:18PM, hazem ahmed mohamed wrote:
> Hey Team,
> 
> 
> 
> I am sending this e-mail to report a performance regression that’s
> caused by commit 244adf6426(ext4: make dioread_nolock the default) , I
> am listing the performance regression symptoms below & our analysis
> for the reported regression.
> 

Although you did mention you already tested on the latest kernel too and there
too you saw a similar performance regression.
But no harm in also double checking if you have this patch [1]. 
This does fixes a similar problem AFAIU.


[1]: https://lore.kernel.org/linux-ext4/20200520133119.1383-1-jack@suse.cz/

-ritesh
