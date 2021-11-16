Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0475072
	for <regressions@lists.linux.dev>; Tue, 16 Nov 2021 09:26:28 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id e7so27302964ljq.12
        for <regressions@lists.linux.dev>; Tue, 16 Nov 2021 01:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=uXQOJVscwHdl85JmQIuN29RMAbn50jaggMEYAGXSbOU=;
        b=fWIo8DYKUOcM4GB+9Zf/cAX4OizcP68XvW0IFnGM2Pwo3bpCeGUn/xubAEsRCt277b
         FYaunPiemZiUZTCsnuzWUKcpTur9EWM0Ef6G8lvg1jaHtbbHbwrdtGcjL7A8oIYHY/pN
         u8SMJf1E7hhJJ04wrQ1uux9hCXHli4RjiXs18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=uXQOJVscwHdl85JmQIuN29RMAbn50jaggMEYAGXSbOU=;
        b=NFG7PZTIrxPZSFVLq/Y987K860wmrRmDL/vq7brrBPbigi0FA1u6oZKTlQS4L+jSyO
         5LZlBhwWNLBNKCQ45Xi2AvYdkFi4KPR2JFMsBnWs2HBybk6/WSuKd5dMbUBrZPhi+WaA
         /1hXQBIE4NQXxBtMcPMqSKdH8u2HHdjPJnYJiZsmgWh9r3XJBXF1ZRoaO8o/zCk/UnFD
         aGVHJwGxTpiL9aSL0feljjOT0lYi9PAaag3uWv//0zfMtVyPXlCRvLmGZUlWQZ/pLPC5
         GfQA9HksdCym5wsrWWQ1uuATkbCBf1YDEMNWgl2EaZjCaIz4U5S8GUHvRW6BhIwOGA8m
         aYRg==
X-Gm-Message-State: AOAM533lHpWbq3OZd2P5yimWflSGkZWqyR8AeKfrhvp8HPFLw97d2tfF
	Em4BUyGL5vyORlfy0rdCvSp0pZ6DYXVAXBkhhThZ/rum7G1OoQ==
X-Google-Smtp-Source: ABdhPJwqDvYTtHcIt7BEhQhue2Yq07xbWw6vHug+VrSswktFDwbYvQxuMF+4Q8nrasGPxnE+vCw9YyqRJKp9PIBaB3Q=
X-Received: by 2002:a2e:a409:: with SMTP id p9mr3587085ljn.412.1637054786755;
 Tue, 16 Nov 2021 01:26:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACAyw99hVEJFoiBH_ZGyy=+oO-jyydoz6v1DeKPKs2HVsUH28w@mail.gmail.com>
In-Reply-To: <CACAyw99hVEJFoiBH_ZGyy=+oO-jyydoz6v1DeKPKs2HVsUH28w@mail.gmail.com>
From: Lorenz Bauer <lmb@cloudflare.com>
Date: Tue, 16 Nov 2021 09:26:16 +0000
Message-ID: <CACAyw99GfxaJa9=gMbMMAJuE2YJ9+fDra-Z1j9fBpuAOovA9Ow@mail.gmail.com>
Subject: Re: Verifier rejects previously accepted program
To: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Nov 2021 at 11:55, Lorenz Bauer <lmb@cloudflare.com> wrote:
>
> Hi Alexei,
>
> I started testing our load balancer on 5.15 today, unfortunately BPF
> which is happy on 5.10 gets rejected on the latest kernel.
>
>     BPF program is too large. Processed 1000001 insn
>     processed 1000001 insns (limit 1000000) max_states_per_insn 28
> total_states 40641 peak_states 1104 mark_read 53

#regzbot fixed-by: 34d11a440c6167133201b7374065b59f259730d7

-- 
Lorenz Bauer  |  Systems Engineer
6th Floor, County Hall/The Riverside Building, SE1 7PB, UK

www.cloudflare.com
