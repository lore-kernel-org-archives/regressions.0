Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5646FC5
	for <regressions@lists.linux.dev>; Tue,  7 Mar 2023 13:18:17 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pZXCX-0004FP-AK; Tue, 07 Mar 2023 14:17:57 +0100
Message-ID: <f3531259-626c-3182-3dba-7118d0c1445c@leemhuis.info>
Date: Tue, 7 Mar 2023 14:17:56 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] igb: revert rtnl_lock() that causes deadlock
Content-Language: en-US, de-DE
To: Lin Ma <linma@zju.edu.cn>, jesse.brandeburg@intel.com,
 anthony.l.nguyen@intel.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, richardcochran@gmail.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com
Cc: intel-wired-lan@lists.osuosl.org, pmenzel@molgen.mpg.de,
 regressions@lists.linux.dev, vinschen@redhat.com, stable@vger.kernel.org
References: <301b585a.80249.186bbe6cc50.Coremail.linma@zju.edu.cn>
 <20230307130547.31446-1-linma@zju.edu.cn>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20230307130547.31446-1-linma@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1678195097;06dd9549;
X-HE-SMSGID: 1pZXCX-0004FP-AK

On 07.03.23 14:05, Lin Ma wrote:
> The commit 6faee3d4ee8b ("igb: Add lock to avoid data race") adds
> rtnl_lock to eliminate a false data race shown below
> 
>  (FREE from device detaching)      |   (USE from netdev core)
> igb_remove                         |  igb_ndo_get_vf_config
>  igb_disable_sriov                 |  vf >= adapter->vfs_allocated_count?
>   kfree(adapter->vf_data)          |
>   adapter->vfs_allocated_count = 0 |
>                                    |    memcpy(... adapter->vf_data[vf]
> 
> [...]
> CC: stable@vger.kernel.org
> Fixes: 6faee3d4ee8b ("igb: Add lock to avoid data race")
> Reported-by: Corinna <vinschen@redhat.com>
> Link: https://lore.kernel.org/regressions/3ef31c0b-ce40-20d0-7740-5dc0cca278ca@molgen.mpg.de/

FWIW, that afaics should be:

Link:
https://lore.kernel.org/intel-wired-lan/ZAcJvkEPqWeJHO2r@calimero.vinschen.de/

(that's the parent of the mail above)

> Signed-off-by: Lin Ma <linma@zju.edu.cn>

Ciao, Thorsten
