Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C49283FDA
	for <regressions@lists.linux.dev>; Fri, 10 Oct 2025 09:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760087752; cv=none; b=uQ9VIR5XSLgYuoWbHoiFJ7ZsTP9FYojK8DTsiiggTUyJ0DLqhFXdL/IJYQixWzH7BDu8QaMgxVd1bfbORel/tec3oH2/I0YduPEBtWy7tGYt1IY+TG5nIIRcUL3N0LNBU77vclfgauHsWjH7qOfKSGuDZtvPDuUEUCQM4lmLVK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760087752; c=relaxed/simple;
	bh=3V1GT6HyCfVAzf6UNmjb6RIU/RQP8szx5cPwRQyaiE8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=BTsUjYs8gXU6P2F0qreS28PdXMgoBAp06aUalB2E8tNTZzH+XIF4IvsmJ+qmRQwJ5kGwG0mXKgQA0931gNiqgDEczy4ycbN8N8kjrj1MTBaCqmzG+063BQ+Np4ct0VJdUWMe695xu/elGoqLvo3rdWZUBephOgYoKAZ+8lfKAsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ae7Vmvrd; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ae7Vmvrd"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-639fb035066so2908479a12.0
        for <regressions@lists.linux.dev>; Fri, 10 Oct 2025 02:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760087749; x=1760692549; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3V1GT6HyCfVAzf6UNmjb6RIU/RQP8szx5cPwRQyaiE8=;
        b=Ae7VmvrdagZcOhNPq5wqRJTwpdaHOlcNY0p2iJ4mn7qXOqzxhn82red5VchazrrYvz
         nW1ZShXQcx45lpRu36AZKQdT8C8eQNF4YLqdw5SJ3KxbB9RSXI/eQOZaVeNNvY9qIB0j
         EN7ynK6kq/7kgf4KEWELa0wMKCORcUlLSG4Om0pX9gWt0zVnMFVBePOPyXLbAzWcU/li
         KdJnUacf9TYSfhjdVxKmz7xBZ+r+sVxstcnI66lLp67Ji6EAD1KHl85EYdeMgVAmyU2j
         d/gehKn5MLirEXDo7gxbhQSvy0+yJ1GGXezWO6eTOeBGfpKTKgr9agDsNTdnFjmW9fKa
         sMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760087749; x=1760692549;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3V1GT6HyCfVAzf6UNmjb6RIU/RQP8szx5cPwRQyaiE8=;
        b=YOPcghaNB764ivjurhNLOJBtRAy71j0KL+Pp9iUZtAbmMqP7v138yb4nJ2crAIh8Za
         q0VIyc2U/aOO1GIXbn72y/VRVJYWPbao6MVjFSxkxPoU5GfZUGJHzTrxito4sfXIpkCN
         CufB0vw/EV9vN4sDTUciSE3LPm4ksA8tFXMN0uQMPA53uuvirEbEL34zIInfG5iwulT9
         W5qv1oO6HJhSYFlmmnpcjZ2LdnalYyvVFKGcK9ZpvHagPu6N/9GBGHPmVwebrnnHh/+Q
         DJbKqnEvcPD4CqJAddXyPfqR6gwiSKnHIRl9jYThVCztVx6eSmWOA1CyQLLcRCKXIMDi
         Topg==
X-Forwarded-Encrypted: i=1; AJvYcCVXoHZgUinVq1wzzx9F+F2mc+Q1zoc/7YBqXPlGIOpybGsVU9wV+I7rtCAeoCG3ioFNE9SANlgmb11ejw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw95EArLWLw4ogwhinpDQMwRGWysVFW0nma333qBNpqkcTMgnVu
	2/iiYlrUmWvHk5fylJT4fOD+tqire5LvEDrG7Ernye75oD9bsSSReerw
X-Gm-Gg: ASbGnctfjSAIWc57WK/fI0shUD6Pics4a9OYYwXsWtvJDNRdV0II0DpvI4NPwZfv7F4
	RvA74Mo1m4ukg7wPTfrUczuaWaJwmjZRju99ImN3TXAiyaJqasXf4osoVJegOL2znJ+Lxfr57sD
	gKnyyUCO73jDBZtg+ouWU6mPmcWo6HIgS1eeDqvTD59FVwm4aSXtUfGCIGZ8RaaX9asWqj//dNh
	HUGxDaqra/L0mNhqL8uXyUDcryzbLwwL3h04Fcoweg0LMx7P5VwKKOYqTDWagtHUUGq3fCMqv2m
	F0yWxlBLDe+D2Wwk/gEI/WcQzmZoYwolTkHMMZS8OABJSdrHtm3zccw04+0EnceZKBjpqAUbqhZ
	hElQ+mbNg1BCTRxl2lGYQsuOifM8vDLbrV3ki0tlSTv5ivQ9SQGpkNxblSaKxQxNiV66VU9GHtI
	eEpoVz47qafyvOhYywQkOMccg=
X-Google-Smtp-Source: AGHT+IGWQFNdHpuCNBUeiUNxPRG6gP9B1LAj+/qRnDzEfFPA7WgmtjSYYnA19Y9QTFoVh8fDL8lwOw==
X-Received: by 2002:a17:907:1b1f:b0:b3f:fcc7:6ed8 with SMTP id a640c23a62f3a-b50aae98249mr1081604166b.29.1760087749039;
        Fri, 10 Oct 2025 02:15:49 -0700 (PDT)
Received: from localhost (91-139-16-234.customers.tmcz.cz. [91.139.16.234])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c12b62sm184019466b.48.2025.10.10.02.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 02:15:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Oct 2025 11:15:47 +0200
Message-Id: <DDEJ18VY6I4W.1CDEOV6MAH04A@gmail.com>
From: "Arisa Snowbell" <arisa.snowbell@gmail.com>
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>, "Michal Pecio"
 <michal.pecio@gmail.com>
Cc: "Arisa Snowbell" <arisa.snowbell@gmail.com>,
 <linux-usb@vger.kernel.org>, <regressions@lists.linux.dev>, "Niklas
 Neronin" <niklas.neronin@linux.intel.com>
Subject: Re: [REGRESSION] [REPRO] USB-A devices not working on boot after
 recent USB merge
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com> <20251007231709.6c16802e.michal.pecio@gmail.com> <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com> <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com> <20251008082055.5646dadc.michal.pecio@gmail.com> <CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com> <20251008130532.49922d58.michal.pecio@gmail.com> <CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com> <20251008223406.13f16f19.michal.pecio@gmail.com> <CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com> <CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com> <20251009131444.2c221922.michal.pecio@gmail.com> <90c03eeb-3913-4968-88c0-0de09023a2b5@linux.intel.com> <20251009152703.72e780b4.michal.pecio@gmail.com> <b8c2423f-aa9d-442a-ae2f-3c4d78949b38@linux.intel.com>
In-Reply-To: <b8c2423f-aa9d-442a-ae2f-3c4d78949b38@linux.intel.com>

I am fine with testing another patch.


- Arisa
