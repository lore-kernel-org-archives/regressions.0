Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B11EBE0
	for <regressions@lists.linux.dev>; Fri, 18 Nov 2022 22:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32327C433D6;
	Fri, 18 Nov 2022 22:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668812084;
	bh=XUml5e9x1N8Dl9Is55TUP9Q9NxSz45lJssiJwljQByc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lE/NQK2ehTx/soa8rsKQLGmEpYoOE0hryTuRy2m5K0txR1Cr260s0LJYULS70HTRD
	 /GvVR93DoAW3rCcZDo4k5+13rBNmT3Xy7FT5ZsLwN4pW4mLaao7cjBDZOU9eqE/FeI
	 y9HnFwkni/C3iE38eYcqgJbnrJnF+Wam9AyT166gdBtxKbifwWdRWx6yknz9LjwVbR
	 6jw9vzsmrHy09A/LuH5cdVGKHy8cq5opNV+0u6PA//mBmXRpaCdX0bRtrFiosqyZOC
	 Stqj7qsjbpG0JdUxFn53Y1rBYgwVBpT3xCCRccwl2Fluzfw+JaKQq0nzJOzO+tb4pe
	 pekp37z0mhs8w==
Date: Fri, 18 Nov 2022 14:54:43 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Ivan Smirnov <isgsmirnov@gmail.com>, "Neftin, Sasha"
 <sasha.neftin@intel.com>, "Fuxbrumer, Devora" <devora.fuxbrumer@intel.com>,
 intel-wired-lan@lists.osuosl.org, "Ruinskiy, Dima"
 <dima.ruinskiy@intel.com>, "Avivi, Amir" <amir.avivi@intel.com>,
 regressions@lists.linux.dev
Subject: Re: [Intel-wired-lan] igc kernel module crashes on new hardware
 (Intel Ethernet I225-V)
Message-ID: <20221118145443.427ecf10@kernel.org>
In-Reply-To: <Y3gKkYeijrAIhxjc@spud>
References: <CAPAtJa_o5q-sU+AD=G3y43H_5pBKnOZTQGXM99uszPXNkn8Z9A@mail.gmail.com>
	<20221031170535.77be0eb5@kernel.org>
	<03f7dc73-3e7c-1e6d-275f-85539493cd7f@intel.com>
	<CAPAtJa8qupPZZ0AiMWSxNKSd-WMg0MQDQeZcCO_Z-GGBu3jZCg@mail.gmail.com>
	<CAPAtJa_-yMusW5-C3BDivMu=MOyfKF9VQkxQotX3L_P+Q48oMA@mail.gmail.com>
	<CAPAtJa_nL5edyiN61ghXZxVUSDBFQQR3uiYJM0uo9mEao=RC0w@mail.gmail.com>
	<CAPAtJa_hbFbVXQbiNnb_byLqtZ-Dy_EBcvTFH9GyPqt__dFmLQ@mail.gmail.com>
	<Y3gKkYeijrAIhxjc@spud>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 18 Nov 2022 22:43:29 +0000 Conor Dooley wrote:
> > Is there any update for the community? More and more folks are asking. We
> > are all techies and happy to help debug.  
> 
> Vested interest since I am suffering from the same issue (X670E-F
> Gaming), but is it okay to add this to regzbot? Not sure whether it
> counts as a regression or not since it's new hw with the existing driver,
> but this seems to be falling through the cracks without a response for
> several weeks.

Dunno, Thorsten's will decide. The line has to be drawn somewhere
on "vendor doesn't care about Linux support" vs "we broke uAPI".
This is the kind of situation I was alluding to in my line of
questioning at the maintainer summit: https://lwn.net/Articles/908324/

Finding a kernel release which does not suffer from the problem
would certainly strengthen your case.
