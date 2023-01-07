Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061DE10FA
	for <regressions@lists.linux.dev>; Sat,  7 Jan 2023 03:26:09 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id s25so3371752lji.2
        for <regressions@lists.linux.dev>; Fri, 06 Jan 2023 19:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s0idPdI9PLBO31vvvrO3UzhchqV8JfFMP/B9EpQ94X4=;
        b=BKsop5Fd9j2waYE+QYe/MTG3xCNzpLA6GxQEImRq55evqkhdueP2mrjpwGEzY1jfd3
         Tcl5rMEeCyTXzbi8UnuxJVqxfJPaQbA5BMRtCWAz3JsnRGxsmlnjuuXZ6w9Dl0+ALMpe
         mJUMzLq44QRNnkRDNn+aZhUrYeRhELduAaoZ/YzQIFyK2hfBeScbF//Vq3oQjZqPnmIT
         2VQqyVnedryEwLGUpY74+VMr3njxAF5oUBsEV2qUndYJRI3kFxFf6+H6pEpXiEJMI5zS
         IJvVeJHBHb0zXGeFgzkxTg5r+9+DY3VklP5opNc+oE3N1ORZeHfBFJlQW1s1AuGmeOju
         gbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0idPdI9PLBO31vvvrO3UzhchqV8JfFMP/B9EpQ94X4=;
        b=J2cJg+vZGmoVhlSAHnV6S1Oy6mTqjZlVRqJ4qPp6XpWAp5GPG/fU4Ld239xl/YpBpV
         LqIXFqZMw1DH6QE8o2EyGv4qsHg2EGvpFOZTBTmJ+PL8ml53/yiX7ubqMM3jqrkU1acr
         HXEvU4J+6m+DasGVlBvTxelGQfEUQc7nU3TJxZJtRp0fSefaEL93cz3acbH1xEuDBuCK
         zaFPkJ3sFW+wU0qvVAMjx+Jaqq4eLETM8VbPzYC28ainEl0dX/XLcpd0tcWJMeo4eGuQ
         aDogCh4JywLAP0UkcsAyRSxUSqcLn+xB7tWh/0QX/yYugMv+TSnHtLjY+p3LPaSLDDZk
         xj9g==
X-Gm-Message-State: AFqh2koxvrUAKuCizHn8bwJgkRU1ohIeC14SQ/E0uqAVWQRIj95H4j7o
	k2M6go/NWtbVGTjiCB1M/kVN7gvnT9Ba+fxIxPY=
X-Google-Smtp-Source: AMrXdXutk6clWXUDfMElnW4XLfAdGcJI+7wAA9hVnfB2R3IOMtOjMP2Z70lw4idmWeRdOFhwILjdf6nTaEeNE2ChIXU=
X-Received: by 2002:a05:651c:141:b0:27f:b76d:4933 with SMTP id
 c1-20020a05651c014100b0027fb76d4933mr2095750ljd.220.1673061967922; Fri, 06
 Jan 2023 19:26:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <d88f4aff-45ad-db10-ada3-f7f5b34a6620@i2se.com> <a223d9ba-2b80-6b6d-dcad-2ca2b170b393@i2se.com>
In-Reply-To: <a223d9ba-2b80-6b6d-dcad-2ca2b170b393@i2se.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Sat, 7 Jan 2023 03:25:56 +0000
Message-ID: <CALeDE9Mzhogxm-05k9gk7htTSkOmfyk+N0-AAwVKs2yPOmyYoQ@mail.gmail.com>
Subject: Re: Regression in brcmfmac for 6.1/6.2-rc1 for SDIO devices
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Justin Forbes <jforbes@fedoraproject.org>, regressions@lists.linux.dev, 
	linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, 
	Hante Meuleman <hante.meuleman@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, 
	Arend van Spriel <aspriel@gmail.com>, "Ivan T. Ivanov" <iivanov@suse.de>
Content-Type: text/plain; charset="UTF-8"

Hi Stefan,

> > could you please provide a "bad case" file list of all firmware files
> > for the Raspberry Pi 3 B+ which worked before Linux 6.1, so i can
> > reproduce it?
> >
> > Also OpenSuSE seems to be affected [1].
>
> Ivan send out a fix, which should also work for Fedora [2].

Yes, he cc:ed me, thanks for heads up, I tested and confirmed it fixed
the issue.

Peter
