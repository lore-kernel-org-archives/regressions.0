Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8657317EF
	for <regressions@lists.linux.dev>; Sun, 26 Feb 2023 09:05:42 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id o3so2568285qvr.1
        for <regressions@lists.linux.dev>; Sun, 26 Feb 2023 01:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3cOaTyOYeIZVxQ057l2U55rNaOc2s+33W9J2wioqy8=;
        b=qpp/YaFJ7zfa5FIJrwen7+2Gll3OqxVOyCqZKRqBSFAIv+fsmZ5vztwLw1zCds24C/
         AYjzuNe05F+AKibK20m+kZnRPmCADTaPIiMSXUnwbjXyDAkI8NKmoH5yWJI0QgLUC6KG
         5ZKAd2F8DX/2RJqlIqJUrArtx6J48Frmw9x8tm5pvU/4wR5QO/xZU/cg3O2+IURxJzhr
         BEoInN6BZCwzeSlwXiym3KNnYEZriY4zAFGGcuGx3NKdjcjHpieOlMjhJQ5OsrlcTxZo
         oCAlmhmcBcLW8yvV+vj+ZEHS5jL9KKvlpTVrwoXjONev59aUj6AtQQ56qNgibd0SbPen
         NtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3cOaTyOYeIZVxQ057l2U55rNaOc2s+33W9J2wioqy8=;
        b=NFezzsnPHwhOk/7iNlNvsuQLUpBmQbydog2SJR2+WcwQSKmsZjW0XjH3yqb/+czCOZ
         JmzGzte3qa+wRsDa0Xf4RTkHVWlr6DvO/gqkX74L/fcGVZ9h7hpo/9MuwdqLLPhwSKP/
         E7fs8B0oa5DooK4mmhXDyslyVOLDa4DeDpxgb5sHzsdh1s5AvOkbwGTP9cBtveQVXQVz
         W2uwTjtLR2jrMBR9Gug3OYX12CVlmDdgmbE8KrXFGicYrhJgoCq+QrqtTwt9IazGMKZf
         9YLuKMl9rmr0Hisl/qgapRp0pMpZYNU1LXnnUvew09cN3HOoIA2UX9n/IiL2zR2HF6OV
         EkwQ==
X-Gm-Message-State: AO0yUKUjppkCmWzz48ZrOO0Txo9yf/FMSSx3nvGR0iVP/OSFUgb8mR3Z
	3i6BySel6u6PcS354Lve/6mNilyR6UjRY8EHyU8=
X-Google-Smtp-Source: AK7set+xyW7+GgEUj6EDSCwU+YR/F6qPgCCgaBhZ+kpYb9NYwxgUAZ5TBXZjObZ8jySGriFXGG4AGryVcTAvX1wAc7E=
X-Received: by 2002:ad4:4b63:0:b0:56e:fbc3:2b86 with SMTP id
 m3-20020ad44b63000000b0056efbc32b86mr3890537qvx.6.1677402341251; Sun, 26 Feb
 2023 01:05:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsO4=qKBF=2FRPVwW8FA4iLFh0Dt9n1BLMec3k10GUorpg@mail.gmail.com>
 <9f682c4d-e7b7-5e23-84f5-cea4fdac2085@leemhuis.info> <CABXGCsNruNKfx3d1dpneRUvn3dCqv_bM93TdJsCLeRYiP3qYaA@mail.gmail.com>
 <6bfa6d67-27ce-04b3-a1f9-3768b8a0169f@leemhuis.info> <CABVgOSnCLbqHHA-gT6FwtJYKYAHt_9uwR_S2r6ZE8hm6eZaLBA@mail.gmail.com>
In-Reply-To: <CABVgOSnCLbqHHA-gT6FwtJYKYAHt_9uwR_S2r6ZE8hm6eZaLBA@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Sun, 26 Feb 2023 14:05:30 +0500
Message-ID: <CABXGCsMW1N6-mHzDfnZGcVgmw0VMUnqCOcoDkzfDDhm+RtSyZQ@mail.gmail.com>
Subject: Re: [6.3][regression] after commit 7170b7ed6acbde523c5d362c8978c60df4c30f30
 my system stuck in initramfs forever
To: David Gow <davidgow@google.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, rmoar@google.com, brendanhiggins@google.com, 
	skhan@linuxfoundation.org, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 26, 2023 at 6:11=E2=80=AFAM David Gow <davidgow@google.com> wro=
te:
>
> Thanks for the report, and sorry this seems to have broken.
>
> I've not been able to reproduce this locally yet, but I'm looking into it=
.
>
> In the meantime, a few questions if you have time:
> - Does this happen with CONFIG_KUNIT=3Dy as well as CONFIG_KUNIT=3Dm?

Yes. CONFIG_KUNIT=3Dy or CONFIG_KUNIT=3Dm it doesn't matter. Both options
leads to being stuck in initramfs forever.

> - Does this patch fix it?
> https://lore.kernel.org/linux-kselftest/20230225014529.2259752-1-davidgow=
@google.com/T/#u

Yes. The patch by this link fixes the issue. Thanks.


Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

--=20
Best Regards,
Mike Gavrilov.
