Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9C1657
	for <regressions@lists.linux.dev>; Sun, 26 Nov 2023 14:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r7GJ4-0001v2-7I; Sun, 26 Nov 2023 15:40:22 +0100
Message-ID: <a1d74498-9c71-4e46-9db3-58baac89dc36@leemhuis.info>
Date: Sun, 26 Nov 2023 15:40:21 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: regression/bisected/6.7rc1: Instead of desktop I see a horizontal
 flashing bar with a picture of the desktop background on white screen
Content-Language: en-US, de-DE
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Lee, Alvin" <Alvin.Lee2@amd.com>
Cc: Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 "Wheeler, Daniel" <Daniel.Wheeler@amd.com>, "Wu, Hersen"
 <hersenxs.wu@amd.com>, "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <CABXGCsNRb0QbF2pKLJMDhVOKxyGD6-E+8p-4QO6FOWa6zp22_A@mail.gmail.com>
 <CABXGCsOqbLRHSkiz79NkVQ-wUtR7y-ZFHvhMw0+JJ_cY2AZmSw@mail.gmail.com>
 <CABXGCsPE9=Qp3Jg5hkRsTQoNgODnS_cXFU1d+hg3Baob40AaAA@mail.gmail.com>
 <edc5b75b-c08d-4c62-ae5e-089ffac27772@amd.com>
 <CABXGCsO=pdxorK9pO7qBPJM-xvgPPtpZqxLvQO4t2AK5qW3vcA@mail.gmail.com>
 <DM8PR12MB5400EAB81E5FA10F4309A732D1B1A@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CABXGCsNpEh7GjFPvx=rz6ZeB7Kx4iqV-e8HyFKyhNau2S5gENw@mail.gmail.com>
 <99ef9596-d4f8-49e2-acbe-ed7486310f84@amd.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <99ef9596-d4f8-49e2-acbe-ed7486310f84@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1701009631;ca9395ba;
X-HE-SMSGID: 1r7GJ4-0001v2-7I

On 16.11.23 11:46, Christian König wrote:
> Am 15.11.23 um 21:08 schrieb Mikhail Gavrilov:
>> On Wed, Nov 15, 2023 at 11:39 PM Lee, Alvin <Alvin.Lee2@amd.com> wrote:
>>> This change has a DMCUB dependency - are you able to update your
>>> DMCUB version as well?
>>>
>> I can confirm this issue was gone after updating firmware.
>>
>> ❯ dmesg | grep DMUB
>> [   11.496679] [drm] Loading DMUB firmware via PSP: version=0x07002300
>> [   12.000314] [drm] DMUB hardware initialized: version=0x07002300
> 
> Mhm, that's a quite ugly problem.
> 
> The driver is supposed to work with older firmware as well or at least
> issue a warning and provide a reasonable fallback.
> 
> How are we going to handle this?

What happened to this regression? This thread looks stalled and from a
quick search on lore and the amdgpu issue tracker it seems the issue
wasn't discussed anywhere else during the last 10 days, but I might have
missed something.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke
