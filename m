Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EFF182A0
	for <regressions@lists.linux.dev>; Thu,  5 Oct 2023 13:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DwMtcyn8"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696510947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yidy6TZBy1CWG6Oo6GwAJihK7/D77PxhLMlTWyhd8wc=;
	b=DwMtcyn8na6LrNt+WcAU8vF9CUkCCEVnfHTRlRK91ttYnDXVCIPjttlxOSVhAm/a14KWKl
	EggF2qtb+zJ7dSpBDP0NdgU8e34AbRmU7Vqfc4kjcDosyKU4J+ZX8qb7nMm9feJSJ3Vk8A
	b+MOuZpWC2rjheNdacdVPh7zFeaIYNM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-WdyyLdzyMXqXEiYWgXXhxA-1; Thu, 05 Oct 2023 09:02:24 -0400
X-MC-Unique: WdyyLdzyMXqXEiYWgXXhxA-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-27911ce6206so874922a91.0
        for <regressions@lists.linux.dev>; Thu, 05 Oct 2023 06:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696510943; x=1697115743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yidy6TZBy1CWG6Oo6GwAJihK7/D77PxhLMlTWyhd8wc=;
        b=e61n5sBwh5rycSZWZU9rIiR5LETV03h9sSGjUslxeOVOhygI7x55pmwOq/npdcfEMa
         BYHHJdmrSpVwXV7e+JswZhuCalDhPH0+VYgJiKJJHLK98J9VzHbxN2vGNxkyGZGG0cp/
         5oX+Grt5S0JnZ1Usa9bjuKE26ja5WJ8vaVXNJybCxY4xpmrFzCyCbANSnWKyGd4Zrdcb
         cXA6GNMameJDVttwRzXygIETtfdnrPBwRCYTIUsKpSZL/KKUYVwbCFFgls54Z4Tv6Nh0
         G92szWC/2C2lst+RJSeEnZvoPUZjdVbKEha+/YVoYtgv0xZDOrBzn5YCg1rMLzAIoVaT
         lXQw==
X-Gm-Message-State: AOJu0Yw/Fiwd3XDgytuqtLZwhb7ERSxRjdZTxB6tzcYG1F5FKW1T3Gi4
	LHMjePaZjSs4yRUNFglocgHnUgSQcc15caU0B57yiANJcvcyeva2JriimdELIpXLzk28oZ5tVTB
	lvCh7GLXm/QZQRmmiYRkqt61IPQsi1MMM4PLQPQ==
X-Received: by 2002:a17:90b:4ad0:b0:274:a021:9383 with SMTP id mh16-20020a17090b4ad000b00274a0219383mr5102298pjb.17.1696510943635;
        Thu, 05 Oct 2023 06:02:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUGIakY6gmiMMg7VIrDCgG6A1oUd7mRza4EcAODeKOxvfyAvfCd+QT1JpHAONy6e0NM9gveMU8O4PPolgXz5g=
X-Received: by 2002:a17:90b:4ad0:b0:274:a021:9383 with SMTP id
 mh16-20020a17090b4ad000b00274a0219383mr5102281pjb.17.1696510943386; Thu, 05
 Oct 2023 06:02:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230928044233.GR3208943@black.fi.intel.com> <20230928154934.GA484133@bhelgaas>
In-Reply-To: <20230928154934.GA484133@bhelgaas>
From: Kamil Paral <kparal@redhat.com>
Date: Thu, 5 Oct 2023 15:01:56 +0200
Message-ID: <CA+cBOTdOVnzbXXPhWhWHDs8=n3A1ixcEg6aDVxjCdsneXySdSA@mail.gmail.com>
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Lukas Wunner <lukas@wunner.de>, 
	linux-pci@vger.kernel.org, regressions@lists.linux.dev, bhelgaas@google.com, 
	chris.chiu@canonical.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 5:49=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
> Do we know how suspend/resume works with Windows in this
> configuration?

Hello Bjorn. I'm not sure if you're asking in general or about my
laptop in particular. I don't have Windows installed, so I don't have
an easy way to test this. There used to be some "evaluation" version
of Windows that I think I could use to test it, but it would be a
considerable time investment for me (including backing up my data,
etc), and I'm currently low on spare time. So at this moment I'm
unfortunately unable to help with this question.

