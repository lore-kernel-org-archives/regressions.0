Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D32170A11
	for <regressions@lists.linux.dev>; Tue,  7 Oct 2025 20:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759870086; cv=none; b=TCIgx/p6usW6hHOUDwt1O56iFRDy3OOMavGT4qMt5hP6InziQMI4GlZYhjxl2d2H5AjRM1SbuZGGUw8TreZQF22HvANruUDoFw98OgEGNqwzQgCgyuOwmQx/Q4JlVF0zJtewHYIbq6yYVq4xx+ALNCovSjhBaxMmlyfMBEjxqeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759870086; c=relaxed/simple;
	bh=GVThB/w8E94RPQpJG/vVhRsqUlj+yLahe7te3a1/Uas=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=g+jcaOfDv1yAm6Sj1g4iwH80nUzAbSeu2Bvy3wbPCPQV/drlFbmVou9nps6cstSQNV8hOakV1sUN7iaU5HukPOA2hMM1150ngl6rT7azF6btHo/c6gFyJ+4MgVsaGXkNuupFVxLk/vRh1EpLAtH0JBRLEfpVKpjArQJVMaualm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wxlfl39P; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wxlfl39P"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-580a1f1f187so2885676137.1
        for <regressions@lists.linux.dev>; Tue, 07 Oct 2025 13:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759870084; x=1760474884; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GVThB/w8E94RPQpJG/vVhRsqUlj+yLahe7te3a1/Uas=;
        b=Wxlfl39PyZ8ehei6cIgvj/pITtHHKakvG2en+bhzavhJ4o5T7usIH1zu0lVAJojg36
         AuTVIZJZDzSGRE+6pidC1B2gM8u/n488C/dPRDrtd6k36FQOUDfNTSbahhZCgflfCkoD
         VUHboLIreopcK5CiPHFB0mwChU4XNE2o+ii1R7Qn2oCsvw88MUPO198jW0VzOIs9Jk6e
         gpRKMXsrXBt8aHsRBp1vk9/Q989Uz9hVmMsnth5muaB1l9xSW6AVGcYrt3ujvOArSL8V
         8q57Z1VVgP9gTLJxaCIWUSSUIum/vPbSSRCfq6r6EKHrWq4Ol+A33c3Wk8k7Ku3DXxjX
         kQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759870084; x=1760474884;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GVThB/w8E94RPQpJG/vVhRsqUlj+yLahe7te3a1/Uas=;
        b=DOBd5H3OKNRjw26X9cb2dDTqthLa9PeIEIlkbdr4GCRAsAgiQYwU09Khggued695lk
         /fldsLVn2IdmF46QcUomvhBRx/KvJG06XQaPK6wXxoaAon+ZBy4upsabjkyOqB+AEuWn
         Q6z87sYujVSicmntlv3+R5bH/nZzt6UPVM0WZRPhzw+DInLYIvVicP13+BLc/uc5BFsE
         FAnvwki0ikjRh/2OP+9rshXLwnfJEkxwZy/ioAVTNwTCbF3dGqgyuuw9wrDjtZD1604U
         KNjhUKkhDP1LWVHTaJM+4I8pxDkeUvdbu7Fiq2KLgAEGyzUkKDJo0DLMy0fovTf2nt15
         Y9XQ==
X-Gm-Message-State: AOJu0YxjtWLCDlI42tCEDS1rzDAAUjlJveEaqOr6jf8Y9HpQvcXCH/Al
	F7GeUG0RdCeAuRH1kHgBACfL/adM9duC1HzhIrDwQZLZ7BKYRinrNTIZDYNKmfG958ov/LlWoNT
	6JVJwWIQXz/mknXOLJMWK00c4OLUw0ik=
X-Gm-Gg: ASbGnctlU52/zHnwN5nCyaJkcpD0MVdr0uHi64JGoQvWz/N6uFl65JVDKxeB6pPqO7P
	+O36/bB7ZIlD+wYD2TjJsqLpIT4wxcSCMnNPnqZOqDdoEaV0c/+bp4V52q+VXbne5gRF88gJevR
	hW7ncx1IzR9OO4zjmneQj6Ni+KbKmRdJl3CAJ7eQYB8WzHeNaK5n5MGMMvyD0GkOgIxEUFlUleC
	FSYSxe5nuGYFlyUxPwczjFDZjnADKA=
X-Google-Smtp-Source: AGHT+IFMyOy5pzH+ob03cL1zxEYTuyJg66UXDzt8N9Fm+hjIboye+WAMWe4+j8PuwB/p4bLcJ3HugU5csydDDdia4Y4=
X-Received: by 2002:a05:6102:6442:b0:522:f65e:c76d with SMTP id
 ada2fe7eead31-5d5e23b0e35mr434638137.23.1759870083857; Tue, 07 Oct 2025
 13:48:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Arisa Snowbell <arisa.snowbell@gmail.com>
Date: Tue, 7 Oct 2025 22:47:52 +0200
X-Gm-Features: AS18NWAkTXxu5Hq3X6oLjNGGzRW09_ajbmmezWgLhZDINHtcebdmkGp5mup4UoI
Message-ID: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
Subject: [REGRESSION] USB-A devices not working on boot after recent USB merge
To: linux-usb@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

this is my first time here, so I hope I am doing everything correctly,
if not - help would be appreciated.

I found regression in the linux-mainline aka linuses branch, more
specifically in the recent USB merge (commit
c6006b8ca14dcc604567be99fc4863e6e11ab6e3).

All my USB-C client -> USB-A host aka computer(probably all USB-A
devices but I don't have more to test) - devices are not detected when
I boot with this patch, I have to replug the device for it to even
show up in dmesg logs.
One device is mice and another one is audio DAC that also shows up as
hub in the dmesg normally.

I reverted the USB merge and everything is fine again.

Happy to provide logs if needed but as I said the devices do not even
show up in dmesg logs on boot and there is no message related to them
not showing up.

Thanks,
Arisa Snowbell
