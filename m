Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAA11C17;
	Sat,  1 Oct 2022 01:18:34 +0000 (UTC)
Received: from letrec.thunk.org ([50.224.35.3])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 2911IDJQ003923
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Sep 2022 21:18:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1664587096; bh=VVrmG+L77k+A4mbQHLm8g6lUcgS5dhy5YDDgl23YS0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n93EJazXxkEDN2ciQ/OumDVDBxmMjqxzZBRYygSMro0tqBMulkfPC5wUS660vCKS3
	 gnP59ewmoUlv4B3lNghs2Zp+VEeDF0HEaKXdVbU0/iXmxTApirywEG8V3R27Rw0bKE
	 tyUBrevRfOCC1r0Y/Th2+zWyOE1xr+hNmScueZk9uhaoBzEmB7vXGxEcmxJT/WyoXX
	 gsaZjNFwGgqBKrw2NmebGrkmI5WXnV4CtwRhNWPvf3gcnvI5TaD6Eqp2IFrOsPYrok
	 bO3AJQ9n51N/v92h8JTuyIOg9R+YPPJKHdA0D377drQs4V0sR3GiiJw2azohWVC1fk
	 iLbz3cs5DlGyQ==
Received: by letrec.thunk.org (Postfix, from userid 15806)
	id 47D538C2AAF; Fri, 30 Sep 2022 21:18:13 -0400 (EDT)
Date: Fri, 30 Sep 2022 21:18:13 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Artem S. Tashkinov" <aros@gmx.com>, "Bird, Tim" <Tim.Bird@sony.com>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Slade Watkins <srw@sladewatkins.net>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        "workflows@vger.kernel.org" <workflows@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <YzeVVV+nPaxsqS0V@mit.edu>
References: <7b427b41-9446-063d-3161-e43eb2e353f9@gmx.com>
 <20220929135325.4riz4ijva2vc7q5p@meerkat.local>
 <95c3384b-53d0-fd6c-6ec5-a7e03fdeddfc@gmx.com>
 <F300ED64-5E8E-4060-89DC-C98BC5FF08E6@sladewatkins.net>
 <YzXK6Px+BrNuuMZH@pendragon.ideasonboard.com>
 <a86adc6d-05db-ec2e-c5de-d280aad9fb8a@leemhuis.info>
 <Yzbtuz6L1jlDCf9/@pendragon.ideasonboard.com>
 <BYAPR13MB250377AAFCC43AC34E244795FD569@BYAPR13MB2503.namprd13.prod.outlook.com>
 <3cfaef48-744f-000f-1be5-6f96d64dea24@gmx.com>
 <YzcdnnjJA4M09dNH@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzcdnnjJA4M09dNH@pendragon.ideasonboard.com>

On Fri, Sep 30, 2022 at 07:47:26PM +0300, Laurent Pinchart wrote:
> > Debian uses an email based bug tracker and you know what? Most people
> > avoid it like a plague. It's a hell on earth to use. Ubunutu's Launchpad
> > which looks and feels like Bugzilla is a hundred times more popular.
> 
> It would be pretty sad if the only options we could come up with for bug
> tracking would be either popular with reporters and ignored by
> maintainers, or the other way around. Ideally we wouldn't have to decide
> which of those two classes of users to prioritize, but I fear that,
> given resource starvation, we'll have to make a decision there that will
> be unpopular with one of the two sides.

Funny thing.  I've largely given up on getting any kind of useful bug
report from Launchpad, so I've largely ignored it.  In contast, the
bug reports I get for e2fsprogs from Debian are generally far more
actionable, with bug reports that have all of the data so I can
actually root cause the problem, and help the user.

So Launchpad may be pretty, but perhaps because of selection bias, the
bug reports I've seen there are generally a waste of my time, and if
I'm going to choose which users I'm going to help for ***free***, it's
going to be the one which is far less frustrating to me as the
volunteer.

"100 times more popular" is not necessarily a feature if what we get
is 1000 times the noise.

> > Sometimes programmers have to realize that most people around are not as
> > smart as they are.

Given my personal experience having seen bug repors from Launchpad,
I'm sure that's true.  The question is whether I want to engage with
people who can't me decent bug reports...  (or who are just asking for
free consulting help; there's a lot of that too).

     	    	       	     	       - Ted
