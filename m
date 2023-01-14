Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43A663D0
	for <regressions@lists.linux.dev>; Sat, 14 Jan 2023 14:53:00 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id b5so2369637wrn.0
        for <regressions@lists.linux.dev>; Sat, 14 Jan 2023 06:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNfS9hq3Jd9+y3no15GrHwb3oIxtxOEzkgxgD6diI+c=;
        b=H7GjTackpwpq5bsoAP3JDZ00CWELzIhssuFXhH7+tp8C+iZsGDGoWUJ3dTIjcKaS0K
         A9tUnWAFA+hON5CBBJILnJ+hBvqLMwG/4L7/sketgMLFmSY0iQt0W577V9B1dQ7QESHJ
         JcTi9mnC7GyWOybsUCuKEZILkwSfvv32laZV5iANUiQ75wI9asQgrhUS5vlvtR0XqOzU
         2ewkXKhlUtVCINlZBoMCU2X/xOnHXbt/W6S476WgnD945zuogIPCsqgaLoqr2InkuDFH
         YJQUwWXn8AYYqR4eJqUogk8+YnaND+jphRLW7vjwXbjs6Fh81PuE2oiI2N9uKRucp0t9
         SD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNfS9hq3Jd9+y3no15GrHwb3oIxtxOEzkgxgD6diI+c=;
        b=ig7vvR3Gr7ZKDEkhkAXDDw/UGdvKkc+ksb5Ps+Dv5rz+kXXPpP+yNKYK5+IlFF7TWp
         SIRNs2WLZQIOTiRnROYJq2Y/Ri05Srb8J4dItM3fm3diNKfw8dzXak8g1g5/eIh/BMin
         Wlenee7v+jIZeHFCEucvKW49esktsJ31S6FUsw7eKnpjI0Y7c3N44SaPQpWW7egfOT1K
         36Zyylnj+vcrBTPRRy8JlU6BAKvkYAFrXnIuZHIf9Oh0l1xb62iWLNvBnu56t+ZcegOh
         Qqj2Y4GowgQZdAq25JSQ7A/bCjXo7pNkQvzBXfjv5feW5MjYAp9RFbabYp/RMrBKbx1n
         aJ+Q==
X-Gm-Message-State: AFqh2kpQO2FSF728AkQ3jw6IFpF0jmPCVHbdP87ro1hs1EfqMQ6AbxQa
	9YoFdzqJrZvFAnDZsoHAeuY=
X-Google-Smtp-Source: AMrXdXsAjsyC1Cj8qg8J8+fykF7Jkm828W2yIULpeTwffczuG9I6Lh88g/8lLArTQr2UaecUeRxmJw==
X-Received: by 2002:adf:ef84:0:b0:2bd:e220:6b9 with SMTP id d4-20020adfef84000000b002bde22006b9mr4544594wro.38.1673707978885;
        Sat, 14 Jan 2023 06:52:58 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d534a000000b00272c0767b4asm21849954wrv.109.2023.01.14.06.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 06:52:58 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 829E7BE2DE0; Sat, 14 Jan 2023 15:52:57 +0100 (CET)
Date: Sat, 14 Jan 2023 15:52:57 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Matthew Fahner <mdfahner@gmail.com>, stable@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Second Monitor Issue on Kernel 6.1.5
Message-ID: <Y8LByXvibutD79au@eldamar.lan>
References: <CADsncqR2mTUArTv2HhRnsfmQx5iNgUZo=JVgkUcZT7MtjxEoYw@mail.gmail.com>
 <Y8JSMlMgnggwOYl0@kroah.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8JSMlMgnggwOYl0@kroah.com>

Hi,

On Sat, Jan 14, 2023 at 07:56:50AM +0100, Greg KH wrote:
> On Fri, Jan 13, 2023 at 11:58:47PM -0500, Matthew Fahner wrote:
> > Hello,
> > 
> > I'm running Ubuntu 20.10 and experienced a regression when trying
> > kernel 6.1.5 that was not present in previous kernels such as 6.0.19
> > or 6.0.9
> > 
> > I have two monitors attached using DisplayPort MST (daisy chaining the
> > displays).
> > 
> > Normally, this works without issue and both monitors are detected and
> > display properly.
> > 
> > With kernel 6.1.5, the second monitor (the monitor that's not directly
> > connected to the computer) was detected but would not display.  I
> > didn't spend much time troubleshooting the issue and instead reverted
> > to 6.0.19 where it again worked without issue.  The first monitor
> > worked without issue.
> > 
> > Let me know what steps I can take to help identify the root cause.
> 
> Can you use 'git bisect' to track down the offending commit?

Not the reporter, but I suspect this is
https://gitlab.freedesktop.org/drm/amd/-/issues/2171 .

Matthew can you verify this matches? There is as well context on this
issue on this thread:

https://lore.kernel.org/stable/8502e5d8-8444-e256-54f3-0c488b54686a@amd.com/

FWIW, we had a similar bugreport downstream in Debian:
https://bugs.debian.org/1028451

Regards,
Salvatore
