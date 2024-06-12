Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE9436AF8
	for <regressions@lists.linux.dev>; Wed, 12 Jun 2024 05:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718170986; cv=none; b=HsDXJy9ClGZRb8uogr3M8tjpLCFivYrYUZvT2X4m+iub5tDV9UjWZzK4ZD24gqZ1J2b82SOI0tdnU+Hb2e0ky4HdVKvbnyAAsZzz4gTyOYS5ZTeyMr6YihpcR4HtMHVUuQhwzhODmatD56F/dT0oJo88gDaN0CUo4bUDKoax5SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718170986; c=relaxed/simple;
	bh=63I+1dEzVeXn42wBYio/c7Yuzom9/7n5V8ZUh47gjH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kRNMzyTLB1eHfPYrx8gK6ZeYbXEjDBjmrvLT8cAOBoZL4DdUWqv7148vfPdmjs1b/G0GZq7ibzTW6ZcpomG1x0f4gQwmAzcyfAunLMuEEw95V8bwgygtlTJIqSpTcNEp/qjQsHOqm+5aA70X07T0gd+84+44CDTZXebwyWxYkmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+Mcmpjv; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+Mcmpjv"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a6f0dc80ab9so244796566b.2
        for <regressions@lists.linux.dev>; Tue, 11 Jun 2024 22:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718170983; x=1718775783; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63I+1dEzVeXn42wBYio/c7Yuzom9/7n5V8ZUh47gjH4=;
        b=E+McmpjvnpeSFa/9E4Z9CHftasI/X7D3w+Hq93hvLaC7WAR1f9yDH+NO5n6fE5sx9I
         VpeJ8Qn8BAiDWkKbtaDKwJac32n/QfyiVSdYJWmjFJh/nO6QLgGxj4MtekeBNVZsSI3o
         l70n9Xm0PyKcfYhIvlU+Cn0A4p5Cus2iuOnHn/5Mksjkj+apcADBT50wf9Fl9WGbzJA0
         Jah1WkO9SevX5ewntMveFstHht23wlehr8hA2KG7vIkOra+qlsrgv+x9stGOf/hyaYDy
         4kUqiq+VjcBpnFVyr5qQIxh/movV9qObsuJnaBMt5aJ7lCAe7x+CItZNLFPxvzhD8A6F
         zoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718170983; x=1718775783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63I+1dEzVeXn42wBYio/c7Yuzom9/7n5V8ZUh47gjH4=;
        b=caTtggK4cCAtoZWuBhXaWDBnsz02MDVJt05+7sJ/vrveYspGz2wTb5o3ayfkjDA3jA
         Uo+hwUSKf0syWhUlMyPdUDAJSSXePIcG8taGc4pQs4OtTlZBaFWReehMNRz21gy358/0
         tEJzX0ZtzErkf51i8DtcffITpHvtAC05uHhUHLGrvsPr46Ls/qFn7W+kkFVMV53JsDDv
         KrV+A73SQzjVM0iWU/L+EpYIIFacVCBAhIM8NIopVcqATUEutfAIZlSjnPT3F+lOqcsC
         UObuQMGip+Hd//gpFwVBnEc/UB/dQsrBrzAbSc8SnPx/9lf01xZrmraMsNXPZiPsG1Cu
         MmwA==
X-Forwarded-Encrypted: i=1; AJvYcCUOY/12Vl8X+NgDA0OrQIUi0n7CgZiHjkab8f38Awg3Wnba89balvNko7kEwAAhqOmhAUvAanbhewKeWq6x8ggXPqvM0tRIvRvzrcQ=
X-Gm-Message-State: AOJu0YziZv/tCotxu2Cn2/SMKdHFLC5cCRhBY8rt+CPkaClzb7f06+Zr
	pUC7AX00TmG9BZlvi+W4pRTsAq05X+u1n1egX61SCB7qwp/RIKIYghFC99PZ0CWmi94CyxEJete
	WeYmGh84kD3BoAISikAOMB/aBNgQ=
X-Google-Smtp-Source: AGHT+IHGu/snvNpAD1Yi6gjHr6w3KtlYXskhYkbq4+1i981NUmF9usvoUiSCiFzsd+OnZAP06utH1HgoD4gnq5XsNuQ=
X-Received: by 2002:a17:906:7251:b0:a6e:57ff:7700 with SMTP id
 a640c23a62f3a-a6f47cc20fcmr35560966b.42.1718170983090; Tue, 11 Jun 2024
 22:43:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240130214911.1863909-1-bvanassche@acm.org> <20240130214911.1863909-12-bvanassche@acm.org>
 <Zmi6QDymvLY5wMgD@surfacebook.localdomain> <678af54a-2f5d-451d-8a4d-9af4d88bfcbb@heusel.eu>
 <9dae2056-792a-4bd0-ab1d-6c545ec781b9@acm.org> <CAHp75Vd02o_z2swHQ8Tajyvdi25do3ys7+GMES7RAg0NffgAUA@mail.gmail.com>
In-Reply-To: <CAHp75Vd02o_z2swHQ8Tajyvdi25do3ys7+GMES7RAg0NffgAUA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 12 Jun 2024 08:42:27 +0300
Message-ID: <CAHp75VePhicGBK3bP3eDmpdH6JLOBh0m7S_oTGxBOtgfhCtU6A@mail.gmail.com>
Subject: Re: [PATCH v9 11/19] scsi: sd: Translate data lifetime information
To: Bart Van Assche <bvanassche@acm.org>
Cc: Christian Heusel <christian@heusel.eu>, "Martin K . Petersen" <martin.petersen@oracle.com>, 
	linux-scsi@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Daejun Park <daejun7.park@samsung.com>, 
	Kanchan Joshi <joshi.k@samsung.com>, Damien Le Moal <dlemoal@kernel.org>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 8:35=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jun 12, 2024 at 2:08=E2=80=AFAM Bart Van Assche <bvanassche@acm.o=
rg> wrote:
> > On 6/11/24 2:21 PM, Christian Heusel wrote:
> > > On 24/06/11 11:57PM, Andy Shevchenko wrote:
...

> > >> This patch broke very badly my connected Garmin FR35 sport watch. Th=
e boot time
> > >> increased by 1 minute along with broken access to USB mass storage.

...

> > Is the Garmin FR35 Flash device perhaps connected to a USB bus? If so,
>
> Yes. It is written above in my report here.

Hmm... Rereading myself and it seems it was not obvious that it's a
USB mass storage device. Sorry for the confusion.

--=20
With Best Regards,
Andy Shevchenko
