Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C112587
	for <regressions@lists.linux.dev>; Mon,  2 Jan 2023 11:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798E0C433EF;
	Mon,  2 Jan 2023 11:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672657754;
	bh=M9mDbZVR4CRey6FhrL7S9PcXw0pAxu7wRACcaKmZbF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p20FkhyetNfhmN9vt1etJmkIVFdmtV575r2xgg+z9Id9fMFuwdXdloNFgJtNvmaIE
	 n4yr+BR4s4FEECvZ+HwzL2xIcx/SFZBRB84vccJvIVx5A7zK/Al0G2dVODBACeSPvG
	 YqoA1CQhoTe2q3JTYq4+sfPg6gTh/gg/x6TRov9Gy7RQ7/EX+gy+an+KNCTjXZHzu9
	 A9/GPFdXvA0mRFCt5RZejnoBtCnJYooNvuAYe4/xV9KC7ikYsOP2tPbZ+mSWar86rw
	 EWYcoxhd55UuMW4Hlqff7q55kM56Iml1lcLCJ2uJUTLy7pmvU2vSdDh11GrGWKH96t
	 6ny4QgJeFuxRQ==
Date: Mon, 2 Jan 2023 11:09:10 +0000
From: Conor Dooley <conor@kernel.org>
To: "Neftin, Sasha" <sasha.neftin@intel.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Ivan Smirnov <isgsmirnov@gmail.com>,
	"Fuxbrumer, Devora" <devora.fuxbrumer@intel.com>,
	intel-wired-lan@lists.osuosl.org,
	"Ruinskiy, Dima" <dima.ruinskiy@intel.com>,
	"Avivi, Amir" <amir.avivi@intel.com>, regressions@lists.linux.dev,
	"Lifshits, Vitaly" <vitaly.lifshits@intel.com>,
	"naamax.meir" <naamax.meir@linux.intel.com>,
	"Meir, NaamaX" <naamax.meir@intel.com>, helgaas@kernel.org
Subject: Re: [Intel-wired-lan] igc kernel module crashes on new hardware
 (Intel Ethernet I225-V)
Message-ID: <Y7K7VgArVFijJMY4@spud>
References: <CAPAtJa_-yMusW5-C3BDivMu=MOyfKF9VQkxQotX3L_P+Q48oMA@mail.gmail.com>
 <CAPAtJa_nL5edyiN61ghXZxVUSDBFQQR3uiYJM0uo9mEao=RC0w@mail.gmail.com>
 <CAPAtJa_hbFbVXQbiNnb_byLqtZ-Dy_EBcvTFH9GyPqt__dFmLQ@mail.gmail.com>
 <Y3gKkYeijrAIhxjc@spud>
 <20221118145443.427ecf10@kernel.org>
 <Y3gTdsg4l71L0vz9@spud>
 <a15508df-eab4-ce00-7340-69323c462fdc@intel.com>
 <Y3qGHROcvdL1vKip@spud>
 <Y6NCzgXZzv+oJKV1@spud>
 <Y7BPIYsBXN0ivoLE@spud>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8hopDFj/ehSmCprM"
Content-Disposition: inline
In-Reply-To: <Y7BPIYsBXN0ivoLE@spud>


--8hopDFj/ehSmCprM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 31, 2022 at 03:02:57PM +0000, Conor Dooley wrote:

> I didn't actually give the bios stuff a go in the end. I figured that
> changing everything at once would likely not be a good idea - but what I
> did do was try v6.1.1 & have now been running for 50-something hours
> without any issues while using the igc iface.

Bah, it died last night about about the 90 hour mark. Still an order of
magnitude longer than I had got it to work sequentially for before, but
not fixed :(

I'll give the bios a go I suppose, sorry for the noise!


--8hopDFj/ehSmCprM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7K7UQAKCRB4tDGHoIJi
0gFdAP4g2vChgwslMx2MWMfdhclDOxjbUsxyd8/8aDrM7rj9swEAhBqFoO9Vdsn2
Fznui7KAoQoajxBUUyGebuOvJFX6PA4=
=zYkj
-----END PGP SIGNATURE-----

--8hopDFj/ehSmCprM--
