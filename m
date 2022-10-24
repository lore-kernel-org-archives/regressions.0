Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435243D6B
	for <regressions@lists.linux.dev>; Mon, 24 Oct 2022 16:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1666628358;
	bh=yEBLDeFnz8EfQ7kKMHjmF2KmCVxvaeuLLjYTy9QKjDc=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:Reply-To:
	 In-Reply-To;
	b=ATU+HrDjOlagK2ITupsIhjb7epirIVUWfdzrGftNETBEmP2+v2CnxlyC1pTiZCcro
	 ktW+0bxrqwU59oE5YQeYFttkX3Qzy9Ej2iqXX8MH0fDHjguF6tFTlJldJy6JK4SQic
	 fGfcwuA8NEJqI18pjaXQp0ZPTBHjP0GSw21UgK2A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.179] ([91.141.38.147]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mxm3Q-1p0ewS1MR4-00zDVO; Mon, 24
 Oct 2022 18:19:18 +0200
Message-ID: <70e16994-6f5b-d648-0848-2eb7e3ad641a@gmx.net>
Date: Mon, 24 Oct 2022 18:19:17 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [Regression] CPU stalls and eventually causes a complete system
 freeze with 6.0.3 due to "video/aperture: Disable and unregister sysfb
 devices via aperture helpers"
Content-Language: de-AT
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Greg KH <gregkh@linuxfoundation.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Sasha Levin <sashal@kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Javier Martinez Canillas <javierm@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <bbf7afe7-6ed2-6708-d302-4ba657444c45@leemhuis.info>
 <668a8ffd-ffc7-e1cc-28b4-1caca1bcc3d6@suse.de>
 <958fd763-01b6-0167-ba6b-97cbd3bddcb6@leemhuis.info>
 <Y1Z2sq9RyEnIdixD@kroah.com> <51651c2e-3706-37d7-01e7-5d473a412850@suse.de>
From: Andreas Thalhammer <andreas.thalhammer-linux@gmx.net>
Reply-To: andreas.thalhammer@linux.com
In-Reply-To: <51651c2e-3706-37d7-01e7-5d473a412850@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BRwFxW5WQgw3ZgRuOhBNRWSsccGlAcy6n5B66EBbfseS4rkhTw9
 21baYB1HQqsrnCm5pD1/B3L35HuQ7y0Meqr/WKqoSjv3x2drjnaEkRVUH8fUfn3DqM29ni2
 eDtumUnpqv9Z7vnmJIxA2OIYarh++Vj4UX1KDnqgoOrKjillriC2UnHvJYkSHO/20WT6p2s
 zWW62wOnnO11Ja8wWiPvQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:A0dwG+zqsRg=:PU2LsS859HRJaR536FTPbA
 1tw/jHxZN2rNsUpOjuAf9czL55i7Vxg2O4YWqbxbhtElMtxIidhkA45rSrYnm1lfqYbPtLyMN
 oGaecZaawvU2FcOx/bYh9EHdZrE4n/BcHNjY2eQbeQspW+TGkNl9qZUq2W/t0zfmZmQhFx27S
 ujBPLvEfz5iiGZBMVAOmROKNF1wNyosdy7yKcL8BYaLacHE1+vQGo1xM53xRF8m2rZSWYS4zO
 2dVs+pMMs3vul4Wg3RYa+OZ0mUV6LwbY1ORPnpPwDOyI+9NsKYv3D89zIrih9tBEiGPmitLdv
 Arto1t10w+8CGJ9eM5cpKG5bM3MEtiJAHSCSeCOlscEDS1m6KtS0q9OwFgYAtYS5XEd2aqVU5
 HxE/4Fr1CLChTHqnhR31npkTea9bpU1NcXi4RLzAECxgnYmsfJCdznul1YykKXfzZccG2L7Yt
 XqvTP+Q+cejcoLR79HldF2IgPeyJOb4Ix1TfzyUirqRZZi4WqD68y/ZYtl8iTkdokZyxe9Dvt
 aBvsOvuNCbO3boXNXHZsucvtVtvV5lHwE/4B/aD9/4ustW6C7SGdezNbQI5hbq8HMUaeuo07C
 Q1USpmcwN5ampmtVjswGBGWECtUFk4IPGj1rSwIPRvzruMsp9JyfQOM0LI0aXniC6XS3NtvfJ
 TVzVDybT1+xT5MjyDlDXwnk3qSooKXL4P7782HuEXfpoKA+U3mAANvXUa7uIWy9z5sd5Uu0kh
 UpTRNwPm1DVcjQ2PVRK3frGhEJKWkj4TSnXwVdMvFSAdbCJPFWCl3hWQ4KMa6SNdz7cpI/HUp
 oKiwwQoh8aKC6SRmy5e7cv1dtIol9YzkjFheAAgCid+ROvckMWQDw6lHsYll9pwazuPAEmPk+
 8XgNLdFZUxVom7JrbevFP917UJkzpOvn8SHnmjaJADOjIfChY1pbuf7lHxf8eyvBwZQDAiSaK
 XjK3Oq//5HLOYk3Sevg7ETUyXXGI0jWb/jY8m8Ut9bYmT2VfOD4y3OYQV9RrvWwwkm+vxWpmX
 m/d91qinvOTGZllobNYx6LDnKJV73VjeePkAg2TVUwdq1L98k39Gn6EjcDpm0b9YPYfnvCQjv
 3k+qupC0sKVC6KvR7hkOVke+SwqBTCjHNwoTbxOYDGjY/bt+GRAgKFESfmNoDxV+CtM1qguwU
 WmLdMcralqSEOzQr9kyjeM22YMPH5RDawsxwDoPzhGrZ81pfaIjsrqXT2sxQaQVZB4hV8S6KY
 wowFRFH5XUeUNH77c3CpIVIdmIsgA3kMZp2EtOoPOHv4pG4Vcb8j82XTJsYnfZyO/LGb4ESqp
 0mZ6z9F7XytYsqGy7HqgnIDhgO19l5q6fPtaLeTABzWdGAoaRN+CJMKQKtLMJl3TpFw9RbJ+c
 JZVTaZXrRcNu586+BqWd6KE2IwiwSBspjqqYro/FFiZZ3emA/6rD2Q6zM/nbAL0hFDpqNG7vH
 QIR48pp65SJdYxJsJIbAm2KCzNbhYPxc9E8F8pfpwq3OKY2qDidMtVupgX5r7RGv5sdGLJH/U
 SNAzVsWVdva4QpDnOOOzH0WpyQLEORTB57ywUC17AJvLnc2H+HNdSFBqGOMgPtKPKUA==

Am 24.10.22 um 13:31 schrieb Thomas Zimmermann:
> Hi
>
> Am 24.10.22 um 13:27 schrieb Greg KH:
>> On Mon, Oct 24, 2022 at 12:41:43PM +0200, Thorsten Leemhuis wrote:
>>> Hi! Thx for the reply.
>>>
>>> On 24.10.22 12:26, Thomas Zimmermann wrote:
>>>> Am 23.10.22 um 10:04 schrieb Thorsten Leemhuis:
>>>>>
>>>>> I noticed a regression report in bugzilla.kernel.org. As many (most?=
)
>>>>> kernel developer don't keep an eye on it, I decided to forward it by
>>>>> mail. Quoting from
>>>>> https://bugzilla.kernel.org/show_bug.cgi?id=3D216616=C2=A0 :
>>>>>
>>>>>> =C2=A0=C2=A0 Andreas 2022-10-22 14:25:32 UTC
>>>>>>
>>>>>> Created attachment 303074 [details]
>>>>>> dmesg
>>>>
>>>> I've looked at the kernel log and found that simpledrm has been loade=
d
>>>> *after* amdgpu, which should never happen. The problematic patch has
>>>> been taken from a long list of refactoring work on this code. No wond=
er
>>>> that it doesn't work as expected.
>>>>
>>>> Please cherry-pick commit 9d69ef183815 ("fbdev/core: Remove
>>>> remove_conflicting_pci_framebuffers()") into the 6.0 stable branch an=
d
>>>> report on the results. It should fix the problem.
>>>
>>> Greg, is that enough for you to pick this up? Or do you want Andreas t=
o
>>> test first if it really fixes the reported problem?
>>
>> This should be good enough.=C2=A0 If this does NOT fix the issue, pleas=
e let
>> me know.
>
> Thanks a lot. I think I can provided a dedicated fix if the proposed
> commit doesn't work.
>
> Best regards
> Thomas
>
>>
>> thanks,
>>
>> greg k-h
>

Thanks... In short: the additional patch did NOT fix the problem.

I don't use git and I don't know how to /cherry-pick commit/
9d69ef183815, but I found the patch here:
https://patchwork.freedesktop.org/patch/494609/

I hope that's the right one. I reintegrated
v2-07-11-video-aperture-Disable-and-unregister-sysfb-devices-via-aperture-=
helpers.patch
and also applied
v2-04-11-fbdev-core-Remove-remove_conflicting_pci_framebuffers.patch,
did a "make mrproper" and thereafter compiled a clean new 6.0.3 kernel
(same .config).

Now the system doesn't even boot to a console. The first boot got me to
a rcu_shed stall on CPUs/tasks, same as above, but this time with:
Workqueue: btrfs-cache btrfs_work_helper

I booted a second time with the same kernel, and it got stuck after
mounting the root btrfs filesystem (what looked like a total freeze, but
when it didn't show a rcu_stall message after ~2 min I got impatient and
wanted to see if I had just busted my root filesystem...)

I booted 6.0.2 and everything is fine. (I'm very glad! I definitely
should update my backup right away!)

I will try 6.1-rc1 next, bear with...

