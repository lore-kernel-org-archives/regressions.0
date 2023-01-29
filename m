Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6004A182
	for <regressions@lists.linux.dev>; Sun, 29 Jan 2023 00:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674951829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kh4675yGn7de7rBJaXu0/haUPHaSoFQ5kB4OsX1qKq0=;
	b=HCxGTk5rIOB6au8y+pIh7mqjh8G9AAfp3p8vR6E8iQX4DULEbDalO/2964BnMvQNwjXTFJ
	BKSGU9hA8lWQnPsludhXOUqRNcHVmnzQm9KYRX0RV/7AmJNofX4hXCmcVaYVG7unqI1Czs
	Sup3AaH8gsJm50Ure9rwG/i1kI0xDX0=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-381-9nkkW8qPMICdq__17WajOg-1; Sat, 28 Jan 2023 19:23:48 -0500
X-MC-Unique: 9nkkW8qPMICdq__17WajOg-1
Received: by mail-yb1-f197.google.com with SMTP id n194-20020a2540cb000000b008038647d9ebso9319726yba.5
        for <regressions@lists.linux.dev>; Sat, 28 Jan 2023 16:23:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kh4675yGn7de7rBJaXu0/haUPHaSoFQ5kB4OsX1qKq0=;
        b=WkdNUWX0a8NHMCVMMlcr3BOPeC4ZO0CWXY9VIErqYSvwN0zpD1tzx66PA8bICohfug
         qgYS2n2mCLAtSQZ3STBd/VoO6rpuskEY7mfepd9MjFpCVtyLVlTsbYux4BGF1Qxun7+E
         IlZgkNgFIEOP8j+J+caQmWq7aWUvFE/8UKM7acTaKBKBo8qE17moMOTkrr9FAansqiRp
         dh9xvoa8bwFMiVumzYnNB1auAp7+d584jRgRH5aYnuWDHEsY/0hJcz4njZYfhNgitdKd
         6gaHuZ4gpcc1A1IyNI1VT8scwnNr1Zn1cHiFgCoOhJqK+oxYg8I0TG74pCvNBPIDyZIA
         5UOQ==
X-Gm-Message-State: AO0yUKVXy+X3W61eDTKcFJ7Zp9EHeLhxohxcCKH7mfG8ns4g0hzDa+e5
	qkw1mRwma+MXPFxubokeyMfyUs01brAuLS4trmu7WYLKHS21nRSpOpdtHVrn5SdkEMh5NpXg0FS
	DteNM/odUKvNEJQIQ0NXtZHlTGxMOyb1dkb40JM0=
X-Received: by 2002:a81:b70e:0:b0:50a:87fe:1e45 with SMTP id v14-20020a81b70e000000b0050a87fe1e45mr1023398ywh.338.1674951827255;
        Sat, 28 Jan 2023 16:23:47 -0800 (PST)
X-Google-Smtp-Source: AK7set9VRK4eguQ/LeiMtOEJbGgCXqEogdn0mkUQqG3AMy+yXBObnoLUE8K2Q58QH+hLrdAZdqkQdhPRNEsdzL/eYFA=
X-Received: by 2002:a81:b70e:0:b0:50a:87fe:1e45 with SMTP id
 v14-20020a81b70e000000b0050a87fe1e45mr1023393ywh.338.1674951827077; Sat, 28
 Jan 2023 16:23:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJD_bPJ1VYTSQvogui4S9xWn9jQzQq8JRXOzXmus+qoRyrybOA@mail.gmail.com>
 <Y9Vg26wjGfkCicYv@kroah.com>
In-Reply-To: <Y9Vg26wjGfkCicYv@kroah.com>
From: Jason Montleon <jmontleo@redhat.com>
Date: Sat, 28 Jan 2023 19:23:36 -0500
Message-ID: <CAJD_bPLkkgbk+GO66Ec9RmiW6MfYrG32WP75oLzXsz2+rpREWg@mail.gmail.com>
Subject: Re: Google Pixelbook EVE, no sound in kernel 6.1.x
To: Greg KH <gregkh@linuxfoundation.org>
Cc: casaxa@gmail.com, cezary.rojewski@intel.com, lma@semihalf.com, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, regressions@lists.linux.dev, 
	stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

I have confirmed 6.2-rc5 is also broken and removing the same commit
causes it to work again.

Thank you,
Jason Montleon

On Sat, Jan 28, 2023 at 12:52 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sat, Jan 28, 2023 at 12:09:54PM -0500, Jason Montleon wrote:
> > I did a bisect which implicated
> > f2bd1c5ae2cb0cf9525c9bffc0038c12dd7e1338 as the first bad commit.
> >
> > Reverting this commit on 6.1.8 gives me working sound again.
> >
> > I'm not clear why this is breaking 6.1.x since it appears to be in
> > 6.0.18 (7494e2e6c55e), which was the last working package in Fedora
> > for the 6.0 line. Maybe something else didn't make it into 6.1?
> >
> >
>
> So this is also broken in Linus's tree (6.2-rc5?)
>
> thanks,
>
> greg k-h
>


-- 
Jason Montleon        | email: jmontleo@redhat.com
Red Hat, Inc.         | gpg key: 0x069E3022
Cell: 508-496-0663    | irc: jmontleo / jmontleon

