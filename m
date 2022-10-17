Received: from domac.alu.hr (domac.alu.hr [161.53.235.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEE9137C
	for <regressions@lists.linux.dev>; Mon, 17 Oct 2022 13:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by domac.alu.hr (Postfix) with ESMTP id 51160604F3;
	Mon, 17 Oct 2022 15:22:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
	t=1666012959; bh=7tDUxNQPZ96lKji4K0afOdf/2mnb+fkiVpxcHgObl4o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ySI6H/SK7VG7/Tob5Crf9x31Lu2iGV9JrdpTx7W7QoCwfi7tnq2xiD4J6bhXZeXNm
	 8HpQkBwf936a+md+j/A+4IRkt8j7KVCRWQe0GqKQef/kDY+e3amcZzXJm7T5ofSS71
	 0bliKvSdpOmqqhELQJX69HdtEC7lbE5iBB5MOwfPo+RW0pyo23HTwNP/Dnw4wIIqKI
	 eps+HR6gdOfR4lgCaZ+LL9vZMQdCIYDG6f5Y+LW3mK+/MMRZuu3En6aZpinWq0vMs7
	 /FaRL7qSS3wFYeB8DX4dC3FNZKe3KHLaPMH28Tx+CH5RD/xm89vdfsCiL76ZlbEfir
	 hnW6htU/XROOA==
X-Virus-Scanned: Debian amavisd-new at domac.alu.hr
Received: from domac.alu.hr ([127.0.0.1])
	by localhost (domac.alu.hr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OMospN1Vpizk; Mon, 17 Oct 2022 15:22:36 +0200 (CEST)
Received: from [161.53.83.51] (pc-mtodorov.grf.hr [161.53.83.51])
	by domac.alu.hr (Postfix) with ESMTPSA id 49C06604EF;
	Mon, 17 Oct 2022 15:22:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
	t=1666012956; bh=7tDUxNQPZ96lKji4K0afOdf/2mnb+fkiVpxcHgObl4o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pc1SeahiGKraLSiku/Vjhw9LcU/lKoXJKswCg6PV3AEclXVmBAsGXsAwBtt+XdfWV
	 gsVCltyfctAEXHErhCUwTKDw+sPYnQcmjELv4gN0Vhxhvw4g8tQZHrI7eFKA+KbJgp
	 /8T/OQ4PslvDp0BFrkDijYAJ4ZjiaVUPkKo+MzD8Rr9+w9259CfPgAbHoNMtDaXqqQ
	 GcEgMKp1QPodv7tv+N4gTTPVFLmRXZBRY90BQJCgvy4rrUp+Ui868dE2Byyluruk0/
	 MdSl9l3UdVWImDMcYeyHaEEK9skiVC2QvzL7w37fpLxQ6PD9Xr8TzGWRhQP7MorQD5
	 XRbfARWSEM9eQ==
Message-ID: <cdf16572-1206-50b8-1ffe-48746cde00a4@alu.unizg.hr>
Date: Mon, 17 Oct 2022 15:22:35 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: BISECT result: 6.0.0-RC kernels trigger Firefox snap bug with
 6.0.0-rc3 through 6.0.0-rc7
Content-Language: en-US
To: Phillip Lougher <phillip@squashfs.org.uk>, regressions@leemhuis.info
Cc: bagasdotme@gmail.com, linux-kernel@vger.kernel.org,
 marcmiltenberger@gmail.com, regressions@lists.linux.dev,
 srw@sladewatkins.net, phillip.lougher@gmail.com
References: <8702a833-e66c-e63a-bfc8-1007174c5b3d@leemhuis.info>
 <20221015205936.5735-1-phillip@squashfs.org.uk>
 <ff2b901d-9491-c886-5330-a244101978ab@alu.unizg.hr>
 <b71f4e2d-23bb-3eb4-3928-fe66c4357e5b@squashfs.org.uk>
From: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
In-Reply-To: <b71f4e2d-23bb-3eb4-3928-fe66c4357e5b@squashfs.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 16.10.2022. 21:55, Phillip Lougher wrote:
> On 16/10/2022 16:55, Mirsad Goran Todorovac wrote:
>> On 15. 10. 2022. 22:59, Phillip Lougher wrote:
>
> Tracking down bugs of this sort is always a process of elimination,
> and gathering information to pinpoint the exact circumstances of why
> it is triggering.
>
> Next step is to download the exact snap(s) where the problems are 
> occurring, as this may provide some insights.
>
> I don't run Ubuntu, and I don't use snaps.  Can you provide the
> download link(s) of the snap(s) that cause problems?  If there's
> any firefox snaps that don't cause problems those will be useful
> too.
>
> You don't mention if there's any errors present in "dmesg" when
> this happens, and so I'm assuming there aren't any?
>
> Phillip

Snaps are originated in Ubuntu, and they heavily rely on snapd, and 
squashfs for decompressing executables.
Naturally, this also affects Linux Mint as Ubuntu's fork.

Those two comprise a large share of the Linux distros, and Firefox is 
exclusively distributed in snaps.

There is no way to install Firefox without snapd and squashfs, so the 
distros are lobotomised from the point of
the Firefox users.

You should basically do what is described here: 
https://snapcraft.io/install/firefox/centos

and probably obvious to you: https://forums.centos.org/viewtopic.php?t=71485

then it's easy:

# snap install firefox

it will install from the latest release.

Thank you.

-- 
Mirsad Todorovac
System engineer
Faculty of Graphic Arts | Academy of Fine Arts
University of Zagreb
Republic of Croatia, the European Union
--
Sistem inženjer
Grafički fakultet | Akademija likovnih umjetnosti
Sveučilište u Zagrebu

