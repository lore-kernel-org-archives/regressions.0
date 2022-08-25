Received: from mout-u-107.mailbox.org (mout-u-107.mailbox.org [80.241.59.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108C21C30
	for <regressions@lists.linux.dev>; Thu, 25 Aug 2022 06:46:36 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4MCtcx08q6z9sTZ;
	Thu, 25 Aug 2022 08:40:17 +0200 (CEST)
Message-ID: <68f140f8-1877-6077-0992-e435fb9a94e7@denx.de>
Date: Thu, 25 Aug 2022 08:40:15 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [Bug 216373] New: Uncorrected errors reported for AMD GPU
Content-Language: en-US
To: Tom Seewald <tseewald@gmail.com>, "Lazar, Lijo" <lijo.lazar@amd.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, regressions@lists.linux.dev,
 David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Daniel Vetter
 <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220819190725.GA2499154@bhelgaas>
 <6aad506b-5324-649e-9700-7ceaaf7ef94b@amd.com>
 <CAARYdbhVwD1m1rAzbR=K60O=_A3wFsb1ya=zRV_bmF8s3Kb02A@mail.gmail.com>
 <30671d88-85a1-0cdf-03db-3a77d6ef96e9@amd.com>
 <CAARYdbhdR0v=V82WnQOGBNrcth8z6F_61SxG9OTzgNpgg3xx7A@mail.gmail.com>
From: Stefan Roese <sr@denx.de>
In-Reply-To: <CAARYdbhdR0v=V82WnQOGBNrcth8z6F_61SxG9OTzgNpgg3xx7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4MCtcx08q6z9sTZ

On 24.08.22 16:45, Tom Seewald wrote:
> On Wed, Aug 24, 2022 at 12:11 AM Lazar, Lijo <lijo.lazar@amd.com> wrote:
>> Unfortunately, I don't have any NV platforms to test. Attached is an
>> 'untested-patch' based on your trace logs.
>>
>> Thanks,
>> Lijo
> 
> Thank you for the patch. It applied cleanly to v6.0-rc2 and after
> booting that kernel I no longer see any messages about PCI errors. I
> have uploaded a dmesg log to the bug report:
> https://bugzilla.kernel.org/attachment.cgi?id=301642

I did not follow this thread in depth, but FWICT the bug is solved now
with this patch. So is it correct, that the now fully enabled AER
support in the PCI subsystem in v6.0 helped detecting a bug in the AMD
GPU driver?

Thanks,
Stefan
