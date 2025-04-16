Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CEA1A2658
	for <regressions@lists.linux.dev>; Wed, 16 Apr 2025 21:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744840266; cv=none; b=X23ZP/qTKg/A+f7eKHhaG5wBy0tNE6JodehaA0uhwOw4Wd7Zn8n9pmXavmm+SwhgGiNlG7mYVo7th6ztQr+ATW7jDiuKENcnkKiwwO1h2SJ1a7Z6YPion/U601OruuaDZ6ftLqPJpCrHoh+IOLP3lhFLieiaDZneQ3kS25i9Fjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744840266; c=relaxed/simple;
	bh=ml9afDM/3Yzyfwll0P+8N2de4+3ysKmPCf/iDrKlRCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gp2fBLujaZH1w4SZ8Muze7u3TLrEuhZhzPTKpiFvl3DW97HlZrwO//yyiIMPFbJ7kfpsDk4aZCcVV82AHtu431Htvlwu6Um7euUpmIS1W3oIHVINTQrN4nFU8LTi8waUXRDkZQPg5bzm25gn0pB5NGDUyn+58PVrraxYzXjdsvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBCfdTzi; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBCfdTzi"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abec8b750ebso17570766b.0
        for <regressions@lists.linux.dev>; Wed, 16 Apr 2025 14:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744840262; x=1745445062; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJdJaIYbEx3ZRtOqC4BE7tYp0utl0F2tybjya7bRNag=;
        b=ZBCfdTzi1QM7cKYGLRFbhdHbRzEs96N81Mtokm11SupOYfzEsWW1gD+XBzQG6IS1ua
         SGyGuuZF76FkhFFjBf5aZhNgXzfk1MoJyMQ2PgUHaxhYemtMp/vnFWMQMMQv6Bqfqd7C
         LM3oJbSiPaahyhoYeEHUYwxxs1x+IQqQv4ASi7S2ynaEGPOa91z0CCu+bWsAiMjE2Jzb
         dKS5bYMP3lG5jcZd0227JqaKPjcSrHNSIkLTbUDhG5wDSOSvv9Fo1jMtFFGLX6zDmzTY
         5FMzf8V7xfparCLz6V/g5axsHyDuEfwGIQ24Z1fw+EN+7U9AdTajfHWXV9OvRqNWE8un
         f4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744840262; x=1745445062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJdJaIYbEx3ZRtOqC4BE7tYp0utl0F2tybjya7bRNag=;
        b=pmp1ILckiZvI6UkhtzN9GZs6Ixrt4gnF9InuQirlf8VzXXtDud7rf0C4SXPUSUGXY0
         oD39+9lkrUA7qJzEn66sMixWMi4ib2WQ79J4dtPYylp26W2I/oV8SgkOjs+5daOLuGl6
         XBTzwo8qaGW/6oX5a6wb1X/uEnd7E8MjFBfl5tCA9yRzIC9i3mtKSt0yt6Y7uYddXUI8
         6ZfnEU8Ss9rI7dWwDg35tP2RxGru6TuH/DSkySzR0gDwPb42Yo/GkYSeb8eeW1g7S6nc
         P75myFG7B55BlLvTOdUSsqbDxOk6cicl9YBrFUFYvMR7qsS4/+/hrAWGKRh5lsOa8CBA
         8nCA==
X-Forwarded-Encrypted: i=1; AJvYcCXUlBW6T/5ZIcas1G2X3RnAnPd5iA3dOT+YIfG1afNn6qHie/veQehIJElMoZ6CoieKi1vzvmhDuSICvw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa2zyLrAHtXc+3M3CtAADCOHQCiY2c7HSKMCmJYe56eX8/p1IT
	GQINKlTjequuedpTNPA4imXqN6AU+J+rORBMYbjjNDnYOICpMFD9
X-Gm-Gg: ASbGncsrck57bMcbP6kquLjEVD4tIUdZyX6TBy78xGfPLqsAw5UK31xUUpPVjyWRnLr
	8R59piovoHwgf2HcnMWQCyUHbpelvHovcECJnFjiTDysdvKHlvC2rvG44gX6iq/6wLRJ3mDkyeJ
	nm/mI+nkwETM4r4TBxTpnB9gbZcTeyBNB1F4lWQvVCT8f25ji+DTqZcoe+HJPjq3g4cCd/5HxNx
	l7pOLEd5YLmfxpJSZxOAyg3LxRC3IYg2SVofTZcdFZUTR7mCcJsMzjzmfhxg3cCGPsAHYTbD90q
	qEKfGtXMKFDRRXihsCif6i7whHECw3hySzvfkw8Ki9u3kFJMKS50BDu5JdyE9PYksd0H8PFXZxQ
	WRk7VRHWm
X-Google-Smtp-Source: AGHT+IFK4dqVh9IwS7sEmyZQt6Kkrhj7u3AOMF7Z1XeZVWstA/f0rOPaMBIQ6cg6ig8xLchc+kWfkw==
X-Received: by 2002:a17:906:d542:b0:aca:e0b7:de03 with SMTP id a640c23a62f3a-acb428f20d5mr382338566b.16.1744840261325;
        Wed, 16 Apr 2025 14:51:01 -0700 (PDT)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f527ee8sm9378835a12.73.2025.04.16.14.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 14:51:00 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id CBD3ABE2DE0; Wed, 16 Apr 2025 23:50:59 +0200 (CEST)
Date: Wed, 16 Apr 2025 23:50:59 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: David Howells <dhowells@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jens Axboe <axboe@kernel.dk>, Al Viro <viro@zeniv.linux.org.uk>,
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Jeff Layton <jlayton@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Hillf Danton <hdanton@sina.com>,
	Christian Brauner <brauner@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	regressions@lists.linux.dev,
	"stable@vger.kernel.org Bernd Rinn" <bb@rinn.ch>,
	Karri =?iso-8859-1?Q?H=E4m=E4l=E4inen?= <kh.bugreport@outlook.com>,
	Milan Broz <gmazyland@gmail.com>,
	Cameron Davidson <bugs@davidsoncj.id.au>, Markus <markus@fritz.box>
Subject: Re: [regression 6.1.y] Regression from 476c1dfefab8 ("mm: Don't pin
 ZERO_PAGE in pin_user_pages()") with pci-passthrough for both KVM VMs and
 booting in xen DomU
Message-ID: <aAAmQ-sRQhejItzQ@eldamar.lan>
References: <Z_6sh7Byddqdk1Z-@eldamar.lan>
 <20250416142645.4392a644.alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416142645.4392a644.alex.williamson@redhat.com>

Hi Alex,

On Wed, Apr 16, 2025 at 02:26:45PM -0600, Alex Williamson wrote:
> On Tue, 15 Apr 2025 20:59:19 +0200
> Salvatore Bonaccorso <carnil@debian.org> wrote:
> 
> > Hi
> > 
> > [Apologies if this has been reported already but I have not found an
> > already filled corresponding report]
> > 
> > After updating from the 6.1.129 based version to 6.1.133, various
> > users have reported that their VMs do not boot anymore up (both KVM
> > and under Xen) if pci-passthrough is involved. The reports are at:
> > 
> > https://bugs.debian.org/1102889
> > https://bugs.debian.org/1102914
> > https://bugs.debian.org/1103153
> > 
> > Milan Broz bisected the issues and found that the commit introducing
> > the problems can be tracked down to backport of c8070b787519 ("mm:
> > Don't pin ZERO_PAGE in pin_user_pages()") from 6.5-rc1 which got
> > backported as 476c1dfefab8 ("mm: Don't pin ZERO_PAGE in
> > pin_user_pages()") in 6.1.130. See https://bugs.debian.org/1102914#60
> > 
> > #regzbot introduced: 476c1dfefab8b98ae9c3e3ad283c2ac10d30c774
> > 
> > 476c1dfefab8b98ae9c3e3ad283c2ac10d30c774 is the first bad commit
> > commit 476c1dfefab8b98ae9c3e3ad283c2ac10d30c774
> > Author: David Howells <dhowells@redhat.com>
> > Date:   Fri May 26 22:41:40 2023 +0100
> > 
> >     mm: Don't pin ZERO_PAGE in pin_user_pages()
> > 
> >     [ Upstream commit c8070b78751955e59b42457b974bea4a4fe00187 ]
> 
> It's a bad backport, I've debugged and posted the fix for stable here:
> 
> https://lore.kernel.org/all/20250416202441.3911142-1-alex.williamson@redhat.com/

Thank you, that worked (replying here as well mainly to fix my mistake
in the CC to stable@vger.kernel.org, which got truncated to
table@vger.kernel.org in my initial submission).


> 
> Thanks,
> Alex
> 

-- 
  .-.  Salvatore Bonaccorso --------------- Debian GNU/Linux Developer
  oo|  ----------------------------------------- http://www.debian.org
 /`'\  GPG key ID: 0x789D6F057FD863FE --------------------------------
(\_;/) Fingerprint: 04A4 407C B914 2C23 030C  17AE 789D 6F05 7FD8 63FE
