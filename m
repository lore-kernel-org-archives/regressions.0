Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147D638C9
	for <regressions@lists.linux.dev>; Mon,  7 Mar 2022 07:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714C7C340F4;
	Mon,  7 Mar 2022 07:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646638804;
	bh=90JipnhONsH+cRU/myoMOoJCjRMpxCED61IM/60Etbw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=sujDwLFIZ9s6U/lq5t5WYSV9IwI6Xqgq8yVcSZQ4btcuExMybeeUjDxEKgHNzYEdJ
	 MGrQVXUNTYZ1YXA/c2y6+HPCea6LpDrDpmzbw8DpOrz/V9g4eh2e2F5KPJX998VjlZ
	 BJa7E0u2vHfO0ozZ6VG/K/UAxoA+3SRSPS7pmJoVJsShmdjUprVgJnmsFKhwpydF9f
	 2uDjNRr/YDVDhXLUOzV8waXDgNCW7v9nJNcg8HEwlkJ0og2W67xTkELaQGqc7bpEXp
	 ESUEb/GDR1QKrtz84EErzRunrq4c10AGW1kYNLx/pcddAdJfDzJIeILxLTuVRkO3DL
	 fb0VrhdVSRzTQ==
From: Kalle Valo <kvalo@kernel.org>
To: Nico Sneck <snecknico@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,  Larry Finger <Larry.Finger@lwfinger.net>,  Yan-Hsuan Chuang <tony0620emma@gmail.com>,  "regressions\@lists.linux.dev" <regressions@lists.linux.dev>,  linux-wireless@vger.kernel.org
Subject: Re: rtw_8822ce wifi regression after kernel update from 5.15 to 5.16
References: <CAO_iuKEL8tHnovpGiQGUxg7JUpZFxHpxhOHbqAMgbt5R4Eftgg@mail.gmail.com>
	<2d1c129b-d473-39e3-69b7-6f36dc1682a6@leemhuis.info>
	<9312eb18-840f-9a1f-bcb0-8e3a43e45239@leemhuis.info>
	<236d45a6-8b88-c02e-a61d-ce1773fdb0ef@lwfinger.net>
	<02ef7552-67f5-dbcf-ece6-87b5b49e1bb5@leemhuis.info>
	<CAO_iuKHQ2DdLvSegcoezCzRVHqNFg+HM8qk1fr1n=s9cMz8QFA@mail.gmail.com>
Date: Mon, 07 Mar 2022 09:39:59 +0200
In-Reply-To: <CAO_iuKHQ2DdLvSegcoezCzRVHqNFg+HM8qk1fr1n=s9cMz8QFA@mail.gmail.com>
	(Nico Sneck's message of "Fri, 4 Mar 2022 16:45:28 +0200")
Message-ID: <877d96xlbk.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Nico Sneck <snecknico@gmail.com> writes:

> Sorry I'm a bit late, been really busy with work lately. Haven't had
> time to continue bisecting, hopefully I can find some time this
> sunday.
>
> I still think this is a kernel regression - I don't believe I'm using
> the driver from Larry's repo. This is a stock Fedora 35 installation,
> I've not installed the driver from Larry's repo, and I don't believe
> Fedora packages it by default.

It's not clear for me if you are using a vanilla release from
kernel.org. But _if_ you are using a Fedora kernel you should report
your problem to Fedora. We have no knowledge what changes distros do to
their kernels.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
