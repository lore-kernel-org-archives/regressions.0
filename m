Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2D220F05
	for <regressions@lists.linux.dev>; Wed, 23 Aug 2023 07:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692774068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zCxuyTwpAkZCk37mZn33IyDjWDzXgnaUh3RjKTM15/c=;
	b=P0PVWIKijx/wfp/hS/bIlnEo6D2ypac6rY45T9AdmdYVUOwMdBV03kQhM1aVVmuhIRR4un
	qttt+DkY7G9ey5v7L5/KpVTfbFf8OVr+f8P+Ie1PRE5mfhouC8HY2AQAyZ0JUoovQajV8a
	X8gcEaqjk0OMiC4ztu+EskJIsjOU85U=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-qwe6Em4rMGu7_qHs3rYV1g-1; Wed, 23 Aug 2023 03:01:06 -0400
X-MC-Unique: qwe6Em4rMGu7_qHs3rYV1g-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-26f2dfb1fdbso4798130a91.2
        for <regressions@lists.linux.dev>; Wed, 23 Aug 2023 00:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692774066; x=1693378866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCxuyTwpAkZCk37mZn33IyDjWDzXgnaUh3RjKTM15/c=;
        b=Mbzsrxx0g9j7NkGA+qeQpHRkD+2rDnV4KIO7sSpdu6bsgL1xBHELZ0Ekef7ILHLGjK
         5diyxrUdOPJx/Y47OwdDxQQwia5BAmWlJjFT1lII6SzZTcm572vj+38j6twpWZkrEUHh
         NS/psJhNjRib3/+1wqhb7GodKMRaPEtNxVLvAWAd+SFiiYjoDxV5QrFWJ+DveR2q3nr4
         eSgpH17zt2l5MiRj9yKQl9LujXO8hBzWhZCjsV1pzb+8/rJWLUfrXh1EkcDaSEHfGV8f
         B9PsKrFuctYYW7lRsMCNm3PxHIR0ZGwyLxptlz6T/ffn9nDBhxVFkl0k/Ms5MTrFefJ+
         mqpA==
X-Gm-Message-State: AOJu0YwXl6kwVR0tCZCzOSxriaeFYq/A9207EoR/pMbSjpRbNHJGlZdo
	KBocfW9kONuICRLhE7QJRC7ddiujEHdxkARiJkV4pF1ru2yq6a4v/EpLVAP5GGh3Z9xngz6BhAt
	fqMtROSB2XZhCnW925jOvgqG2Hk4c9hiiY4p/HQ==
X-Received: by 2002:a17:90b:1882:b0:267:ffcf:e9e3 with SMTP id mn2-20020a17090b188200b00267ffcfe9e3mr11020169pjb.46.1692774066040;
        Wed, 23 Aug 2023 00:01:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwbDCu65zazbtvERo2dSRY8zAUK59fINDdDAUFIjyiz53LnwxLGt7vY+xzLr1JpWTI+nrQCWgl97TYj5JqCkw=
X-Received: by 2002:a17:90b:1882:b0:267:ffcf:e9e3 with SMTP id
 mn2-20020a17090b188200b00267ffcfe9e3mr11020148pjb.46.1692774065746; Wed, 23
 Aug 2023 00:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+cBOTeWrsTyANjLZQ=bGoBQ_yOkkV1juyRvJq-C8GOrbW6t9Q@mail.gmail.com>
 <20230821131223.GJ3465@black.fi.intel.com> <CA+cBOTc-7U_sumg6g-uBs9w3m8xipuOV1VY=4nmBcyuppgi8_g@mail.gmail.com>
 <20230823050714.GP3465@black.fi.intel.com>
In-Reply-To: <20230823050714.GP3465@black.fi.intel.com>
From: Kamil Paral <kparal@redhat.com>
Date: Wed, 23 Aug 2023 09:00:39 +0200
Message-ID: <CA+cBOTdS5djXL=93VThP9K67pjYKHtjceqSczKf8NQonhpgo5Q@mail.gmail.com>
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-pci@vger.kernel.org, regressions@lists.linux.dev, 
	bhelgaas@google.com, chris.chiu@canonical.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 7:07=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> Okay if I understand correctly with commit 7b3ba09febf4 things works as
> before and you don't see any delays in resume?

If commit 7b3ba09febf4 is included but commit e8b908146d44 is
excluded, the resume works as usual. Once e8b908146d44 is included (it
doesn't matter whether 7b3ba09febf4 is included or not), the resume
gets delayed by ~60 seconds.

