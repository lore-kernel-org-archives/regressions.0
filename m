Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994223211
	for <regressions@lists.linux.dev>; Wed, 21 Sep 2022 12:23:32 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1279948d93dso8737436fac.10
        for <regressions@lists.linux.dev>; Wed, 21 Sep 2022 05:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=3aJj791SFi8MBmk/3DDeNGs8qJFxgSOFtNXhCuwyFlE=;
        b=gZm6pXwMq2/JC/UTzDilnXvNNyRSckcot0YJ/NTaLbwgqLHVdBCLiaVvIB0NkJ3bmZ
         1nk1BYSkGZOBASjKxyjllVNk8cab+Hm+DELpIecZjGPDzX2v6JwuUZjXls2mHcirK/+e
         GjHbLX+FHDyaNPWfCqF087+Pmtdly7g0V902It5/Dx8SAE/K1+IM5JFG6ucNTT+cOkQf
         m8u3mwFCbWbPL8pqwWcIkjsxR8riTQ9TH/I8mBcIyfB08ZYi+DoeoHcsYYgHLNBEQyFC
         KgihHc1TC+jck3iRBGiWUKBctERjn3cr1gNKfLL4FDlLcx9b8NBlZbFIrHHHViZYVUGz
         VmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=3aJj791SFi8MBmk/3DDeNGs8qJFxgSOFtNXhCuwyFlE=;
        b=l/J7v16ClD6G2G6Hc5+4j5PybO2lDQu1fvBhMqpWP2qQB35/m5CLY1DY5oFpnJSGh/
         asmpj7s2pQKLi1kbe1bzY7e9idzeQ1Lcuwd921vgBm1LNdUENlyB3fY1l6km171DrOmM
         rMrV/DMx+U3qIYw81Af6rs6EYxKiQCbaLy0NPTvB9oWYXqPRyrumYyUumlOJI5sF55Ri
         F0NUWQuqMLy2XguawyX8KmG6ok1j67saqn6UNtRNBAJiDEs2+31aaTcms8d6crIL1JM/
         Cl1ZO6Pvj0D7OOmOGswG7jQwSMbEtN+1y0nBB6qtv8DBivbQVj/nU2syn/XNGsmq0nyq
         HOdg==
X-Gm-Message-State: ACrzQf0oCPRqJ/6dVQeWOSws3NF7TSWLJQ3VXybOycAClLDDbWBb7oBD
	aTzLOgY5AMQDyu1oJL0/M35KqsqCdMQxYl6KncU=
X-Google-Smtp-Source: AMsMyM5ErvoOnIfJMUuBO4BbuAQd4iK1fvd9USzMtEX4sLhb80TdK3rfkL+JCPZ9lgL8+EHwcHMCghXo3GDIFPNl3xA=
X-Received: by 2002:a05:6870:a78e:b0:12b:542b:e5b2 with SMTP id
 x14-20020a056870a78e00b0012b542be5b2mr4900564oao.112.1663763011355; Wed, 21
 Sep 2022 05:23:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACX6voDfcTQzQJj=5Q-SLi0in1hXpo=Ri28rX73Og3GTObPBWA@mail.gmail.com>
 <20220921044419.epojssm3g4j3qkup@riteshh-domain>
In-Reply-To: <20220921044419.epojssm3g4j3qkup@riteshh-domain>
From: hazem ahmed mohamed <hazem.ahmed.abuelfotoh@gmail.com>
Date: Wed, 21 Sep 2022 13:22:55 +0100
Message-ID: <CACX6voCxHGd46ehrsys+3sVrA2Stq++O2ofh7E6f4MTN59Z2NQ@mail.gmail.com>
Subject: Re: Ext4: Buffered random writes performance regression with
 dioread_nolock enabled
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>, "tytso@mit.edu" <tytso@mit.edu>, 
	"adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, "Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for sharing that unfortunately this patch has been merged to
kernel 5.7 and I am still seeing that regression with later versions
that include that patch.

Hazem.

On Wed, 21 Sept 2022 at 05:44, Ritesh Harjani (IBM)
<ritesh.list@gmail.com> wrote:
>
> On 22/09/19 04:18PM, hazem ahmed mohamed wrote:
> > Hey Team,
> >
> >
> >
> > I am sending this e-mail to report a performance regression that=E2=80=
=99s
> > caused by commit 244adf6426(ext4: make dioread_nolock the default) , I
> > am listing the performance regression symptoms below & our analysis
> > for the reported regression.
> >
>
> Although you did mention you already tested on the latest kernel too and =
there
> too you saw a similar performance regression.
> But no harm in also double checking if you have this patch [1].
> This does fixes a similar problem AFAIU.
>
>
> [1]: https://lore.kernel.org/linux-ext4/20200520133119.1383-1-jack@suse.c=
z/
>
> -ritesh
