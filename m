Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D351D530
	for <regressions@lists.linux.dev>; Tue, 21 Mar 2023 20:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679430588; i=dahms.tobias@web.de;
	bh=3vrnUaZQjktarTyyAWmtSbWvpA3xyzQS8LOv5gymyyM=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iV3AooqEBuUznJ33+O5rJ0s17zSV0bJ5fU56ZZ+EhuSy90cpx7TE/J6QnswDqB9/7
	 vDeu/+FtZ5Y00TK5zDytdoxpVh35KgEipVQbTvEtSPrtuXjKqUMYlBcYTQNn+MYACq
	 2TK72/zQVHeqoHoCX+N60Rd0pZAErb4Z6I6eBUy3S/ORkRMcn1uy6zOIKbnto/P/8r
	 mb67WK7DriFoLaOQNrfe7p/esWdACheAPF5jvLR6HZ5xHl6e8Muyt7A5fHfKE4g84v
	 CRZCml9AocEIK5qtbA4gw/J1O/BMTK7jOH+FAfc3IL2K70lR6TR67reYtbTB6Jo3kM
	 TnF1/kP9X3obA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.2.2] ([92.206.138.58]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MgibW-1q8Y4y23J6-00h2bQ; Tue, 21
 Mar 2023 21:22:24 +0100
Message-ID: <f8f7d7ae-7e4b-e0fb-6a21-1d4fdcc22035@web.de>
Date: Tue, 21 Mar 2023 21:22:23 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: kernel error at led trigger "phy0tpt"
Content-Language: de-DE
To: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>, stable@vger.kernel.org,
 regressions@lists.linux.dev
Cc: linux-wireless@vger.kernel.org, linux-leds@vger.kernel.org
References: <91feceb2-0df4-19b9-5ffa-d37e3d344fdf@web.de>
 <be785bbb-d77d-9930-56d0-dcef26f07bb2@leemhuis.info>
From: Tobias Dahms <dahms.tobias@web.de>
In-Reply-To: <be785bbb-d77d-9930-56d0-dcef26f07bb2@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uHQnkX0fYIYlHoABAFNTANHLkC3kvk98ARgpoB0OZ0avajHCvlG
 BJird9BaItFEqkVoLuUpMAKtu1xKLR8ie5pN/iECs7wAIQpK0Eu13GWGgqtMNpCn46At2EQ
 Nr30f1wbNf41laurSwZmIo+CxRtlovme6KLNHUwxdT9LRoSS8Lve1+RpeM9Ouki0TiVPx/x
 g4kEqKBOe1vO8lZt8Y4vA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sRULRAH17Lo=;p6f8/A1MtWr60s5IfRxed7Etev+
 m8ZAk8ZUoNY21ayFED7PKqzmTta358hecZx2W3iqERwI9A9U2oQOxt/+4GyQkMfFBiJYek84U
 fvFxoRR7/TkBKYuraSdbYdVSiq7wU6f+4qilYjHzoc8QvX30n/7M4ymTc8i6nrhLqjBVuylhZ
 QkrwzmRFw1qb2D2yiVJPe8yb8GCfPKJl29kN5RHd6tLmqpDFr8TKV97SPADILQTdy9FY/DMDA
 hzLdbFPrACnpXS4GRlH/NpirEnGZerBwlaqhYu6RgDA2s3piZpPiUy1yuRsfRBjTs7ef2fcPW
 bcbWnD2xE2n+Ar6Ha4ZJZUKtbRp1EZlOu6RKpBpJS9066MnZw64VOrdBDgkFsRa6UfD3IkGLb
 Inuzj4XU/OieVjmL3uTUfGQCMKWrz4JfYKSzlv0XAKhUW84OMW/l214kJ23ZbAY/YrN2tDd2g
 JZy34ydWC0I/lpneZ/4GO8GYBuSZkzZ0haUxKhpW874i58rrtSYiIz44qTpLggpEfk9E/pdb0
 OvwQn2xQzb2Yh5JFqJgdsfHCrtEPwSWaymwMFogrINZJTgqSbvIgERsZZIjd3/fSBxUQ+Y0Pt
 sDLn+iG38dLD0TfdfOH6ytmYIIp0YFnCjfC+X3AEmPdxk5B9cs0Wwe4M4U+1aXshxmWqZenwE
 TEbGl8cRHV0NFLVYR+hn6rWK+FHG8OMHEN5RtTcnKF1YAdeSs+/LmTsUTlkQ6Y41eCegJQfos
 w1Mv3UvkYQmnOyh8hPDjDAuUaW6KdY0yUpV2TFhH2NAAE4VVx45tBVI7qmAAh4oQxxOBhaAWT
 rzUlmRyxCUj+9jr1OWdIutKieiIOV1rj1xGO2KZb5SToK+Y+hAOBr1nnhypf5F47kUCG7J1Px
 38nCaLMYkapnAhTlZ6yRrqBvLhi/JLaxSgYpUDKgS2fqe3DxKLe+x4hEDSiHnxyQXg621qwpH
 nuBm1Lr21xCJnb9BZpHOYD3Kwa8=

Hi Thorsten,

all mentioned kernels are vanilla kernels. The "-bpi-r2" is only a
suffix from CONFIG_LOCALVERSION=3D"-bpi-r2"

I will bisect on weekend and come back to you.

regards
Tobias

Am 21.03.23 um 15:40 schrieb Linux regression tracking (Thorsten Leemhuis)=
:
> On 20.03.23 20:44, Tobias Dahms wrote:
>> Hello,
>>
>> since some kernel versions I get a kernel errror while setting led
>> trigger to phy0tpt.
>>
>> command to reproduce:
>> echo phy0tpt > /sys/class/leds/bpi-r2\:isink\:blue/trigger
>>
>> same trigger, other led location =3D> no error:
>> echo phy0tpt > /sys/class/leds/bpi-r2\:pio\:blue/trigger
>>
>> other trigger, same led location =3D> no error:
>> echo phy0tx > /sys/class/leds/bpi-r2\:isink\:blue/trigger
>>
>> last good kernel:
>> bpi-r2 5.19.17-bpi-r2
>>
>> error at kernel versions:
>> bpi-r2 6.0.19-bpi-r2
>> up to
>> bpi-r2 6.3.0-rc1-bpi-r2+
>
> Thx for the report.
>
> "5.19.17-bpi-r2" sounds like a vendor kernel. Is that one that is
> vanilla or at least close to vanilla? If not, you'll have to report this
> to your kernel vendor. If not: could you try to bisect this?
>
>> wireless lan card:
>> 01:00.0 Network controller: MEDIATEK Corp. MT7612E 802.11acbgn PCI
>> Express Wireless Network Adapter
>>
>> distribution:
>> Arch-Linux-ARM (with vanilla kernel instead of original distribution
>> kernel)
>>
>> board:
>> BananaPi-R2
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
