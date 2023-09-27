Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25691A589
	for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 20:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6C0C433C8;
	Wed, 27 Sep 2023 20:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695846116;
	bh=Zzz4VsjLRN0k9sQiBjLgrvvrT3aJ/bCSF5TgMvK3B/o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YVyh9vF1FOGAbZAERGckWyCFZB3gNyThQVkXYAL6cBKBjHUFhgGt6AJYCeSgZWDDh
	 uml9PdgJ1HZSOivof5N/zr+CzmQbAiXcB7OnLeUqb0zx0ki1ShDNdDbzl4Kb84Fj9w
	 eOYNsjZNo0gY94gJndkiZlwXJk9um1/QhAjLQGO2afTl253dHenQf3OAvrUICSC7dn
	 g8bp7CxpO2ee5J/7OBvILltAIp59DnaZl2Oi5Xkwbzhgg4EEoShSRZPFVLAMqEsqNq
	 DKDb+pkKu1dtn8qTNh0Yu9Nmxi9oKAdF06OPy0ScfmE8b7mf+UllSQ/NhvQKaDOs6k
	 kujC6craqEG6g==
Message-ID: <9c208dd856b82a4012370b201c08b2d73a6c130e.camel@kernel.org>
Subject: Re: [REGRESSION] EINVAL with mount in selinux_set_mnt_opts when
 mounting in a guest vm with selinux disabled
From: Jeff Layton <jlayton@kernel.org>
To: Simon Kaegi <simon.kaegi@gmail.com>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, dhowells@redhat.com, 
	jpiotrowski@linux.microsoft.com, brauner@kernel.org, sashal@kernel.org
Date: Wed, 27 Sep 2023 16:21:54 -0400
In-Reply-To: <CACW2H-5W6KE6UJ8HwD6r9pOx4Ow_W6ACZyg9LpTykjU6tHHB3g@mail.gmail.com>
References: 
	<CACW2H-5W6KE6UJ8HwD6r9pOx4Ow_W6ACZyg9LpTykjU6tHHB3g@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2023-09-27 at 15:55 -0400, Simon Kaegi wrote:
> #regzbot introduced v6.1.52..v6.1.53
> #regzbot introduced: ed134f284b4ed85a70d5f760ed0686e3cd555f9b
>=20
> We hit this regression when updating our guest vm kernel from 6.1.52 to
> 6.1.53 -- bisecting this problem was introduced
> in ed134f284b4ed85a70d5f760ed0686e3cd555f9b -- vfs, security: Fix automou=
nt
> superblock LSM init problem, preventing NFS sb sharing --
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
h=3Dv6.1.53&id=3Ded134f284b4ed85a70d5f760ed0686e3cd555f9b
>=20
> We're getting an EINVAL in `selinux_set_mnt_opts` in
> `security/selinux/hooks.c` when mounting a folder in a guest VM where
> selinux is disabled. We're mounting from another folder that we suspect h=
as
> selinux labels set from the host. The EINVAL is getting set in the
> following block...
> ```
> if (!selinux_initialized(&selinux_state)) {
>         if (!opts) {
>                 /* Defer initialization until selinux_complete_init,
>                         after the initial policy is loaded and the securi=
ty
>                         server is ready to handle calls. */
>                 goto out;
>         }
>         rc =3D -EINVAL;
>         pr_warn("SELinux: Unable to set superblock options "
>                 "before the security server is initialized\n");
>         goto out;
> }
> ```
> We can reproduce 100% of the time but don't currently have a simple
> reproducer as the problem was found in our build service which uses
> kata-containers (with cloud-hypervisor and rootfs mounted via virtio-blk)=
.
>=20
> We have not checked the mainline as we currently are tied to 6.1.x.
>=20
> -Simon

This sounds very similar to the bug that Ondrej fixed here:

    https://lore.kernel.org/selinux/20230911142358.883728-1-omosnace@redhat=
.com/

You may want to try that patch and see if it helps.
--=20
Jeff Layton <jlayton@kernel.org>
