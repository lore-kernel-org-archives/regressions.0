Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F284A1A738
	for <regressions@lists.linux.dev>; Fri, 27 Oct 2023 10:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y0SLBfZS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB489C433C9;
	Fri, 27 Oct 2023 10:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698403250;
	bh=xAGxfyHHv/qoLztaLbM/AYY0bd9UklJKfVVTVre2pKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0SLBfZSvsYfDAJFW4jc5hLoIe1nU7qYLrOFzgY0Cy7CfjTgDJNfqzMTq8WCQ750A
	 DucCkwsuSn9sl+Z+R19FhJhVRB8iwlWeP+5vzX6tOkfV9Kb93q4PQEm/GxUUeqG35F
	 3GcE1LxXCD62MPBOXSrRijT9C8NztFYeLqHVQGZs=
Date: Fri, 27 Oct 2023 12:40:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Paul Lawrence <paullawrence@google.com>,
	Daniel Rosenberg <drosen@google.com>,
	Alessio Balsini <balsini@android.com>,
	Amir Goldstein <amir73il@gmail.com>,
	Bernd Schubert <bschubert@ddn.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: [PATCH v2] Revert "fuse: Apply flags2 only when userspace set
 the FUSE_INIT_EXT"
Message-ID: <2023102731-wobbly-glimpse-97f5@gregkh>
References: <20230904133321.104584-1-git@andred.net>
 <20231018111508.3913860-1-git@andred.net>
 <717fd97a-6d14-4dc9-808c-d752d718fb80@ddn.com>
 <4b0b46f29955956916765d8d615f96849c8ce3f7.camel@linaro.org>
 <fa3510f3-d3cc-45d2-b38e-e8717e2a9f83@ddn.com>
 <1b03f355170333f20ee20e47c5f355dc73d3a91c.camel@linaro.org>
 <9afc3152-5448-42eb-a7f4-4167fc8bc589@ddn.com>
 <5cd87a64-c506-46f2-9fed-ac8a74658631@ddn.com>
 <8ae8ce4d-6323-4160-848a-5e94895ae60e@leemhuis.info>
 <CAOssrKdvy9qTGSwwPVqYLAYYEk0jbqhGg4Lz=jEff7U58O4Yqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOssrKdvy9qTGSwwPVqYLAYYEk0jbqhGg4Lz=jEff7U58O4Yqw@mail.gmail.com>

On Wed, Oct 25, 2023 at 03:17:09PM +0200, Miklos Szeredi wrote:
> On Wed, Oct 25, 2023 at 1:30 PM Linux regression tracking (Thorsten
> Leemhuis) <regressions@leemhuis.info> wrote:
> 
> > Miklos, I'm wondering what the status here is. The description in the
> > reverts André sent[1] are maybe a bit vague[2], but it sounds a lot like
> > he ran into a big regression that should be addressed somehow -- maybe
> > with a revert. But it seems we haven't got any closer to that in all
> > those ~7 weeks since the first revert was posted. But I might be missing
> > something, hence a quick evaluation from your side would help me a lot
> > here to understand the situation.
> 
> I don't think the Android use case counts as a regression.

Why not?  In the changelog for this commit, it says:

    There is a risk with this change, though - it might break existing user
    space libraries, which are already using flags2 without setting
    FUSE_INIT_EXT.

And that's exactly what Android was doing.  Not all the world uses libfuse,
unfortunatly.

Yes, Android did have an out-of-tree change to support a fuse extension that is
not accepted upstream yet (but I think they submitted it already), and
they had to figure out the "safest" way to do so to keep compability
with everything else.

Now yes, that attempt failed, and now older Android userspace breaks
with newer kernels because of this commit, which you all even agreed
might happen here!

So either you have a policy of "we only care about libfuse use cases for
this api", or you don't, which is fine, just say so.  But that's not
what the changelog says.

> If they'd use an unmodified upstream kernel, it would be a different case.
> 
> But they modify the kernel heavily, and AFAICS this breakage is
> related to such a modification (as pointed out by Bernd upthread).

They add a new fuse extension, yes.  How do you suggest they do so in an
abi-safe way for the future when features are not accepted by upstream?

> André might want to clarify, but I've not seen any concrete real world
> examples of regressions caused by this change outside of Android.

Android is _only_ a few billion devices, it doesn't get much more "real
world" than that.  All other Linux instances are just a rounding error :)

thanks,

gre gk-h
