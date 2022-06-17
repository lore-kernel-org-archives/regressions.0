Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D746C17D3
	for <regressions@lists.linux.dev>; Fri, 17 Jun 2022 14:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C5CC3411B;
	Fri, 17 Jun 2022 14:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655477447;
	bh=M5/he+GrjhQIeU9BeJjdwoSJo2WLcrjwgadxd/BUjOc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Hik994yWZ1OHmY2jb7UzV/Gqx9JAsGxXem0AR66qQjzyb8tWswEJSfca/kVPdTKZd
	 ZyvVAp9R25b3OJ+VDKqLanZ+iaYnHBu4V9tR7iXg60NlkbosiY8ItWPe8DX2eXXHfG
	 vQCGE/e3nZLN3zEeIq0dTj44r1VuYOiiHqEbqYritDxVahC4mF71ZgrSPyd8H2UONa
	 eJXhD8Fdoh+GJafuw0CK9u2eioKMZizLp1E9vr6Bc9/BLM2ThwWpm5cHZsrw2Jh4sI
	 Q1vz6uURqZIH3VxvGuPmkPrRERzw3J/8PPinjp7gKdhe/A6ONpJVprsuVayoZuQZQT
	 GMhg7VHKIPu1A==
Date: Fri, 17 Jun 2022 07:50:46 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: golan.ben.ami@intel.com, Luca Coelho <luciano.coelho@intel.com>,
 Johannes Berg <johannes@sipsolutions.net>, Gregory Greenman
 <gregory.greenman@intel.com>, Udo Steinberg <udo@hypervisor.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Bug 215635 - iwlwifi: Firmware crash with firmware
 36.ca7b901d.0 (8265-36.ucode)
Message-ID: <20220617075046.79f41945@kernel.org>
In-Reply-To: <28d2123f-65ce-f69c-12e1-f672b26225f4@leemhuis.info>
References: <915d6d66-4e42-8cbf-76bc-0f2f72d5e7d6@leemhuis.info>
	<20220616115808.141dec76@kernel.org>
	<28d2123f-65ce-f69c-12e1-f672b26225f4@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Jun 2022 08:38:55 +0200 Thorsten Leemhuis wrote:
> > Any progress / outputs on this one? Folks are reporting it's still
> > happening on Fedora 36 w/ 5.17.13.  
> 
> Jakub, thx for bringing this up, I had "look  into this again" on my
> todo list for some time already. Out of interest: where where those reports?

The reports I was referring to are internal at Meta.
